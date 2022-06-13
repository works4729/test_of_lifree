#
# Module manifest for module 'SSMAgent-Toolkit'
#
# Generated by: takakima@
#
# Generated on: 9/14/2020
#
# Update and maintained by: aaalzand@
#
# Last Update 09/17/2021

@{

    # Script module or binary module file associated with this manifest.
    RootModule = ''
    
    # Version number of this module.
    ModuleVersion = '1.0'
    
    # Supported PSEditions
    # CompatiblePSEditions = @()
    
    # ID used to uniquely identify this module
    GUID = '8210de98-c2cc-4ff6-a986-1c89cf2cd570'
    
    # Author of this module
    Author = 'aaalzand@'
    
    # Company or vendor of this module
    CompanyName = 'Amazon'
    
    # Copyright statement for this module
    Copyright = ''
    
    # Description of the functionality provided by this module
    # Description = ''
    
    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'
    
    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @("Get-AgentProxySettings","Get-IEProxySettings","Get-InstanceID","Get-LocalSystemAccountEnvironmentVariablesProxy","Get-MetadataAccess","Get-Region","Get-ServiceAvailability","Get-ServiceAccount","Get-ServiceStatus","Get-LocalSystemAccountSTSCallerIdentity","Get-SystemWideEnvironmentVariablesProxy","Get-SystemWideProxy","Get-WindowsImageState","Invoke-SSMChecks","New-MetadataToken","Test-EndpointsNetworkAccess","Test-IAMInstanceProfile","Test-IAMInstanceProfileCredentialLastUpdate","Test-HybridRegistration","Get-SSMAgentVersion","Get-SessionManagerPluginVersion","Get-ServiceStartupMode")
    
    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()
    
    # Variables to export from this module
    VariablesToExport = '*'
    
    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()
    
    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{
        PSData = @{
            # Tags applied to this module. These help with module discovery in online galleries.
            # Tags = @()
    
            # A URL to the license for this module.
            # LicenseUri = ''
    
            # A URL to the main website for this project.
            # ProjectUri = ''
    
            # A URL to an icon representing this module.
            # IconUri = ''
    
            # ReleaseNotes of this module
            # ReleaseNotes = ''
    
        } # End of PSData hashtable
    
    } # End of PrivateData hashtable
    
    # HelpInfo URI of this module
    # HelpInfoURI = ''
    
    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''
    
    }
    