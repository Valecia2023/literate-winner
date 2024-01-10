$BaselinePath = "../../../../baselines/"

# $ProductNames = Get-ChildItem $BaselinePath -Filter "*.md" | ForEach-Object {$_.Name.SubString(0, $_.Name.Length - 3)}
$ProductNames = @("teams") # TODO as other products are updated to the new format,
# add them to above list. Once all products have been updated, replace the list with
# the commented out code above to generate the list automatically.

$Output = @{}

foreach ($Product in $ProductNames) {
    $Output[$Product] = @()
    $MdLines = Get-Content "$($BaselinePath)$($Product).md"

    # Select-String line numbers aren't 0-indexed, hence the "-1" on the next line
    $LineNumbers = Select-String "## [0-9]+\." "$($BaselinePath)$($Product).md" | ForEach-Object {$_."LineNumber"-1}
    $Groups = $LineNumbers | ForEach-Object {$MdLines[$_]}

    foreach ($GroupName in $Groups) {
        $Group = @{}
        $Group.GroupNumber = $GroupName.Split(".")[0].SubString(3) # 3 to remove the "## "
        $Group.GroupName = $GroupName.Split(".")[1].SubString(1) # 1 to remove the leading space
        $Group.Controls = @()

        $IdRegex =  "#### MS\.[a-zA-Z]+\.$($Group.GroupNumber)\."
        # Select-String line numbers aren't 0-indexed, hence the "-1" on the next line
        $LineNumbers = Select-String $IdRegex "$($BaselinePath)$($Product).md" | ForEach-Object {$_."LineNumber"-1}
        foreach ($LineNumber in $LineNumbers) {
            # This assumes that the value is on the immediate next line after the ID
            $Value = [string]$MdLines[$LineNumber+1]
            $Id = [string]$MdLines[$LineNumber].Substring(5)
            $Deleted = $Id.EndsWith("X")
            $Group.Controls += @{"Id"=$Id; "Value"=$Value; "Deleted"=$Deleted}
        }

        $Output[$Product] += $Group
    }
}

ConvertTo-Json $Output -Depth 4 # TODO save as file