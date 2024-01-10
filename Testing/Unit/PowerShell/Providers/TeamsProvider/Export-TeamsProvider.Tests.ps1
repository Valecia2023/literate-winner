<#
 # Due to how the Error handling was implemented, mocked API calls have to be mocked inside a
 # mocked CommandTracker class
#>
$ProviderPath = "../../../../../PowerShell/ScubaGear/Modules/Providers"
Import-Module (Join-Path -Path $PSScriptRoot -ChildPath "$($ProviderPath)/ExportTeamsProvider.psm1") -Function Export-TeamsProvider -Force
Import-Module (Join-Path -Path $PSScriptRoot -ChildPath "$($ProviderPath)/ProviderHelpers/CommandTracker.psm1") -Force

InModuleScope -ModuleName ExportTeamsProvider {
    Describe -Tag 'ExportTeamsProvider' -Name "Export-TeamsProvider" {
        BeforeAll {
            class MockCommandTracker {
                [string[]]$SuccessfulCommands = @()
                [string[]]$UnSuccessfulCommands = @()

                [System.Object[]] TryCommand([string]$Command, [hashtable]$CommandArgs) {
                    # This is where you decide where you mock functions called by CommandTracker :)
                    try {
                        switch ($Command) {
                            "Get-CsTenant" {
                                $this.SuccessfulCommands += $Command
                                return [pscustomobject]@{}
                            }
                            "Get-CsTeamsMeetingPolicy" {
                                $this.SuccessfulCommands += $Command
                                return [pscustomobject]@{}
                            }
                            "Get-CsTenantFederationConfiguration" {
                                $this.SuccessfulCommands += $Command
                                return [pscustomobject]@{}
                            }
                            "Get-CsTeamsClientConfiguration" {
                                $this.SuccessfulCommands += $Command
                                return [pscustomobject]@{}
                            }
                            "Get-CsTeamsAppPermissionPolicy" {
                                $this.SuccessfulCommands += $Command
                                return [pscustomobject]@{}
                            }
                            "Get-CsTeamsMeetingBroadcastPolicy" {
                                $this.SuccessfulCommands += $Command
                                return [pscustomobject]@{}
                            }
                            default {
                                throw "ERROR you forgot to create a mock method for this cmdlet: $($Command)"
                            }
                        }
                        $Result = @()
                        $this.SuccessfulCommands += $Command
                        return $Result
                    }
                    catch {
                        Write-Warning "Error running $($Command). $($_)"
                        $this.UnSuccessfulCommands += $Command
                        $Result = @()
                        return $Result
                    }
                }

                [System.Object[]] TryCommand([string]$Command) {
                    return $this.TryCommand($Command, @{})
                }

                [void] AddSuccessfulCommand([string]$Command) {
                    $this.SuccessfulCommands += $Command
                }

                [void] AddUnSuccessfulCommand([string]$Command) {
                    $this.UnSuccessfulCommands += $Command
                }

                [string[]] GetUnSuccessfulCommands() {
                    return $this.UnSuccessfulCommands
                }

                [string[]] GetSuccessfulCommands() {
                    return $this.SuccessfulCommands
                }
            }
            function Get-CommandTracker {}
            Mock -ModuleName ExportTeamsProvider Get-CommandTracker {
                return [MockCommandTracker]::New()
            }
            function Test-SCuBAValidProviderJson {
                param (
                    [string]
                    $Json
                )
                $Json = $Json.TrimEnd(",")
                $Json = "{$($Json)}"
                $ValidJson = $true
                try {
                    ConvertFrom-Json $Json -ErrorAction Stop | Out-Null
                }
                catch {
                    $ValidJson = $false;
                }
                $ValidJson
            }
        }
        It "returns valid JSON" {
                $Json = Export-TeamsProvider -M365Environment 'commercial'
                $ValidJson = Test-SCuBAValidProviderJson -Json $Json | Select-Object -Last 1
                $ValidJson | Should -Be $true
            }
    }
}
AfterAll {
    Remove-Module ExportTeamsProvider -Force -ErrorAction SilentlyContinue
    Remove-Module CommandTracker -Force -ErrorAction SilentlyContinue
}
