# Example variabe that will be exported from the module (must be "Global:")
[String]$Global:ExampleVarFromExtension = "Hello World!"

#region Function Show-ExampleFunctionFromExtension
Function Show-ExampleFunctionFromExtension {
<#
.SYNOPSIS
	Example Function that simply outputs a textstring that is given as input parameter
.DESCRIPTION
	Not much to say
.PARAMETER String
	A text string
.EXAMPLE
	ExampleFunctionFromExtension -String "Hello World"
.NOTES
	Created by ceterion AG
	This is an internal script function and should typically not be called directly.
.LINK
	http://www.ceterion.com
#>
	[CmdletBinding()]
	Param (
		#  Get the current date
		[Parameter(Mandatory=$True)]
		[ValidateNotNullorEmpty()]
		[string]$String
	)
	
	Begin {
		## Get the name of this function and write header
		[string]${CmdletName} = $PSCmdlet.MyInvocation.MyCommand.Name
		Write-FunctionHeaderOrFooter -CmdletName ${CmdletName} -CmdletBoundParameters $PSBoundParameters -Header
	}
	Process {
		Try {
			Write-Host $String
		}
		Catch {
                Write-Log -Message "Unexpected error . `n$(Resolve-Error)" -Severity 3 -Source ${CmdletName}
    			If (-not $ContinueOnError) {
				Throw "Unexpected error.: $($_.Exception.Message)"
			}
		}
	}
	End {
		Write-FunctionHeaderOrFooter -CmdletName ${CmdletName} -Footer
	}
}
#endregion Function Show-ExampleFunctionFromExtension

#region PackageStartExtension
[Scriptblock]$Global:PackageStartExtension = {
    
    # The content of this script block will be executed automatically at package start. You can place your own custom code inside this script block

}
#endregion PackageStartExtension

#region PackageEndExtension
[Scriptblock]$Global:PackageEndExtension = {

    # The content of this script block will be executed automatically at package end. You can place your own custom code inside this script block

}
#endregion PackageEndExtension


## Export functions, aliases and variables
Export-ModuleMember -Function * -Alias * -Variable *

# SIG # Begin signature block
# MIIuPQYJKoZIhvcNAQcCoIIuLjCCLioCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDN1BV2AmAQ+SfQ
# r0yJs9ymg8wyEZf2eO21BQCdoJ2tQKCCJnEwggXJMIIEsaADAgECAhAbtY8lKt8j
# AEkoya49fu0nMA0GCSqGSIb3DQEBDAUAMH4xCzAJBgNVBAYTAlBMMSIwIAYDVQQK
# ExlVbml6ZXRvIFRlY2hub2xvZ2llcyBTLkEuMScwJQYDVQQLEx5DZXJ0dW0gQ2Vy
# dGlmaWNhdGlvbiBBdXRob3JpdHkxIjAgBgNVBAMTGUNlcnR1bSBUcnVzdGVkIE5l
# dHdvcmsgQ0EwHhcNMjEwNTMxMDY0MzA2WhcNMjkwOTE3MDY0MzA2WjCBgDELMAkG
# A1UEBhMCUEwxIjAgBgNVBAoTGVVuaXpldG8gVGVjaG5vbG9naWVzIFMuQS4xJzAl
# BgNVBAsTHkNlcnR1bSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTEkMCIGA1UEAxMb
# Q2VydHVtIFRydXN0ZWQgTmV0d29yayBDQSAyMIICIjANBgkqhkiG9w0BAQEFAAOC
# Ag8AMIICCgKCAgEAvfl4+ObVgAxknYYblmRnPyI6HnUBfe/7XGeMycxca6mR5rlC
# 5SBLm9qbe7mZXdmbgEvXhEArJ9PoujC7Pgkap0mV7ytAJMKXx6fumyXvqAoAl4Va
# qp3cKcniNQfrcE1K1sGzVrihQTib0fsxf4/gX+GxPw+OFklg1waNGPmqJhCrKtPQ
# 0WeNG0a+RzDVLnLRxWPa52N5RH5LYySJhi40PylMUosqp8DikSiJucBb+R3Z5yet
# /5oCl8HGUJKbAiy9qbk0WQq/hEr/3/6zn+vZnuCYI+yma3cWKtvMrTscpIfcRnNe
# GWJoRVfkkIJCu0LW8GHgwaM9ZqNd9BjuiMmNF0UpmTJ1AjHuKSbIawLmtWJFfzcV
# WiNoidQ+3k4nsPBADLxNF8tNorMe0AZa3faTz1d1mfX6hhpneLO/lv403L3nUlbl
# s+V1e9dBkQXcXWnjlQ1DufyDljmVe2yAWk8TcsbXfSl6RLpSpCrVQUYJIP4ioLZb
# MI28iQzV13D4h1L92u+sUS4Hs07+0AnacO+Y+lbmbdu1V0vc5SwlFcieLnhO+Nqc
# noYsylfzGuXIkosagpZ6w7xQEmnYDlpGizrrJvojybawgb5CAKT41v4wLsfSRvbl
# jnX98sy50IdbzAYQYLuDNbdeZ95H7JlI8aShFf6tjGKOOVVPORa5sWOd/7cCAwEA
# AaOCAT4wggE6MA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFLahVDkCw6A/joq8
# +tT4HKbROg79MB8GA1UdIwQYMBaAFAh2zcsH/yT2xc3tu5C84oQ3RnX3MA4GA1Ud
# DwEB/wQEAwIBBjAvBgNVHR8EKDAmMCSgIqAghh5odHRwOi8vY3JsLmNlcnR1bS5w
# bC9jdG5jYS5jcmwwawYIKwYBBQUHAQEEXzBdMCgGCCsGAQUFBzABhhxodHRwOi8v
# c3ViY2Eub2NzcC1jZXJ0dW0uY29tMDEGCCsGAQUFBzAChiVodHRwOi8vcmVwb3Np
# dG9yeS5jZXJ0dW0ucGwvY3RuY2EuY2VyMDkGA1UdIAQyMDAwLgYEVR0gADAmMCQG
# CCsGAQUFBwIBFhhodHRwOi8vd3d3LmNlcnR1bS5wbC9DUFMwDQYJKoZIhvcNAQEM
# BQADggEBAFHCoVgWIhCL/IYx1MIy01z4S6Ivaj5N+KsIHu3V6PrnCA3st8YeDrJ1
# BXqxC/rXdGoABh+kzqrya33YEcARCNQOTWHFOqj6seHjmOriY/1B9ZN9DbxdkjuR
# mmW60F9MvkyNaAMQFtXx0ASKhTP5N+dbLiZpQjy6zbzUeulNndrnQ/tjUoCFBMQl
# lVXwfqefAcVbKPjgzoZwpic7Ofs4LphTZSJ1Ldf23SIikZbr3WjtP6MZl9M7JYjs
# NhI9qX7OAo0FmpKnJ25FspxihjcNpDOO16hO0EoXQ0zF8ads0h5YbBRRfopUofbv
# n3l6XYGaFpAP4bvxSgD5+d2+7arszgowggXSMIIDuqADAgECAhAh1tBKTyUPyTI3
# /KpeEo3pMA0GCSqGSIb3DQEBDQUAMIGAMQswCQYDVQQGEwJQTDEiMCAGA1UEChMZ
# VW5pemV0byBUZWNobm9sb2dpZXMgUy5BLjEnMCUGA1UECxMeQ2VydHVtIENlcnRp
# ZmljYXRpb24gQXV0aG9yaXR5MSQwIgYDVQQDExtDZXJ0dW0gVHJ1c3RlZCBOZXR3
# b3JrIENBIDIwIhgPMjAxMTEwMDYwODM5NTZaGA8yMDQ2MTAwNjA4Mzk1NlowgYAx
# CzAJBgNVBAYTAlBMMSIwIAYDVQQKExlVbml6ZXRvIFRlY2hub2xvZ2llcyBTLkEu
# MScwJQYDVQQLEx5DZXJ0dW0gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxJDAiBgNV
# BAMTG0NlcnR1bSBUcnVzdGVkIE5ldHdvcmsgQ0EgMjCCAiIwDQYJKoZIhvcNAQEB
# BQADggIPADCCAgoCggIBAL35ePjm1YAMZJ2GG5ZkZz8iOh51AX3v+1xnjMnMXGup
# kea5QuUgS5vam3u5mV3Zm4BL14RAKyfT6Lowuz4JGqdJle8rQCTCl8en7psl76gK
# AJeFWqqd3CnJ4jUH63BNStbBs1a4oUE4m9H7MX+P4F/hsT8PjhZJYNcGjRj5qiYQ
# qyrT0NFnjRtGvkcw1S5y0cVj2udjeUR+S2MkiYYuND8pTFKLKqfA4pEoibnAW/kd
# 2ecnrf+aApfBxlCSmwIsvam5NFkKv4RK/9/+s5/r2Z7gmCPspmt3FirbzK07HKSH
# 3EZzXhliaEVX5JCCQrtC1vBh4MGjPWajXfQY7ojJjRdFKZkydQIx7ikmyGsC5rVi
# RX83FVojaInUPt5OJ7DwQAy8TRfLTaKzHtAGWt32k89XdZn1+oYaZ3izv5b+NNy9
# 51JW5bPldXvXQZEF3F1p45UNQ7n8g5Y5lXtsgFpPE3LG130pekS6UqQq1UFGCSD+
# IqC2WzCNvIkM1ddw+IdS/drvrFEuB7NO/tAJ2nDvmPpW5m3btVdL3OUsJRXIni54
# TvjanJ6GLMpX8xrlyJKLGoKWesO8UBJp2A5aRos66yb6I8m2sIG+QgCk+Nb+MC7H
# 0kb25Y51/fLMudCHW8wGEGC7gzW3XmfeR+yZSPGkoRX+rYxijjlVTzkWubFjnf+3
# AgMBAAGjQjBAMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFLahVDkCw6A/joq8
# +tT4HKbROg79MA4GA1UdDwEB/wQEAwIBBjANBgkqhkiG9w0BAQ0FAAOCAgEAcaUO
# zuTpvz841YlaxAJh+0zFFBcti09TaxAX/GWExxBJkN7bxyaTiCZvcNYCXjmg94+r
# lrWlE1yBFG0OgYIRG4pOxk+l3WIeRN8JWfRbdws36YsgxvgKTi5YHOsz0M+GYMna
# +4AvnkxghHg9IWTW+0EfGA/nyXVxvb1c3jSHPkGwDva51j8JE5YUL96aHVq5Vs41
# OrBfcE1e4ynxIyhyWbarwoxmJhx3LCZ2NYsop2mg+Tv1I92FEHTJkANWkeevukfU
# EpcRIuOiSZRs57eUS7otpNozi0ymRP9aPMYdZNi1MeSmPHqoVwvb7WEay/HOc3dj
# pIdvTFE41uRfx5+2gSrkhUh5WF47+NsCgmfBOdvDdEs9Nh75KZOIaFuoRBkh8Kfo
# gQ0s6JM2tDeyyrAbJnqaJR+amoCeSyo/+6Oa/nMyccKexnLhimgn8eQPtMRMpWGT
# +JcQByowJam5yHG472jMLX714H4Pgqhvtrpsg0N3zYqSF6GeW3gWPUXiM3Ld4WbK
# mdPJxSb9DWgERq622ZuMvhm+scbyGeNcAsos2G9KB9nJNdpAdfLEpxlvnkIQmHXm
# lYtgvO3FEteKztWYXFaWA8XudwY1/8/k7j8TYe7b2i2F8M2unbIYCUXDkqFyF/xH
# tqALLPHE3kNoCGpfO/B2Y/vMBiymxuIOtbm+JI8wggaVMIIEfaADAgECAhAJxcz4
# u2Z9cTeqwVmABssxMA0GCSqGSIb3DQEBDAUAMFYxCzAJBgNVBAYTAlBMMSEwHwYD
# VQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAiBgNVBAMTG0NlcnR1bSBU
# aW1lc3RhbXBpbmcgMjAyMSBDQTAeFw0yMzExMDIwODMyMjNaFw0zNDEwMzAwODMy
# MjNaMFAxCzAJBgNVBAYTAlBMMSEwHwYDVQQKDBhBc3NlY28gRGF0YSBTeXN0ZW1z
# IFMuQS4xHjAcBgNVBAMMFUNlcnR1bSBUaW1lc3RhbXAgMjAyMzCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBALkWuurG532SNqqCQCjzkjK3p5w3fjc5Y/O0
# 04WQ5G+xzq6SG5w45BD6zPEfSOyLcBGMHAbVv2hDCcPHUI46Q6nCbYfNjbPG0l7Z
# faoL4fwMy3j6dQ0BgW4wQyNF6rmm0NMjcmJ0MRuBzEp2vZrN8LCYncWmoakqvUtu
# 0IPZjuIuvBk7E4OR1VgoTIkvRQ8nYDXwmA1Hnj4JnT+lV8J9s4RlqDrmjJTcDfdl
# jzyHmaHOf1Yg8X+otHmq30cp727xj64yDPwwpBqAf9qNYb+5hyp5ArbwBLcSHkBx
# LCXjEV/AcZoXATHEFZJctlEZRuf1oV2KtJkop17bSnUI6WZmTEiYlj5vFBhKDDmc
# QzSM+Dqt48P7QhBBzgA8rp1IcA5BLdC8Emt/NNaUJCiQa06/Fw0izlw69oA2ZNwZ
# wuCQfR4eAwGksWVzLMTRCRjwd6H7GW1kUSIC8rmBufwIezyij2jT8mMup1Zgutbg
# ecRLjf80LX+w5oJWa2yVNoWhb9ZFFu0lpGsr/TeMWOs33bV0Ke1FGKcH8TDcxDWT
# E83rThYIx4u8A6lPcXkpsFeg8Osyhb04ZNidiq/zwDqFNtUVGz4SLxQmOTgiV86S
# cdZ26KZEpDgtgNjUYNIDfdhRn9zc+ii1qdzaJY81q+PL+J4Ngh0fxdVtF9apyGcO
# lMT7Q0VzAgMBAAGjggFjMIIBXzAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBTHaTwu
# 5r3jWUf/GRLB2TToQc/jjzAfBgNVHSMEGDAWgBS+VAIvv0Bsc0POrAklTp5DRBru
# 4DAOBgNVHQ8BAf8EBAMCB4AwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwMwYDVR0f
# BCwwKjAooCagJIYiaHR0cDovL2NybC5jZXJ0dW0ucGwvY3RzY2EyMDIxLmNybDBv
# BggrBgEFBQcBAQRjMGEwKAYIKwYBBQUHMAGGHGh0dHA6Ly9zdWJjYS5vY3NwLWNl
# cnR1bS5jb20wNQYIKwYBBQUHMAKGKWh0dHA6Ly9yZXBvc2l0b3J5LmNlcnR1bS5w
# bC9jdHNjYTIwMjEuY2VyMEEGA1UdIAQ6MDgwNgYLKoRoAYb2dwIFAQswJzAlBggr
# BgEFBQcCARYZaHR0cHM6Ly93d3cuY2VydHVtLnBsL0NQUzANBgkqhkiG9w0BAQwF
# AAOCAgEAeN3usTpD5vfZazi9Ml4LQdwYOLuZ9BSdton2cUU5CmLM9f5gike4rz1M
# +Q50MXuU4SZNnNVCnDSTCkhkO4HyVIzQbD0qWg69ciwaMX8qBM3FgzlpWJA0y2gi
# IXpb3Kya5sMcXuUTFJOg93Wv43TNgZeUTW4Rfij3zwr9nuTCAT8YLrj1LU4RnkgZ
# IaaKu1yu4tf/GGMgMDlL9xV/PRZ78SUdqYez5R9bf8jFOKC++rgkJt1keD0OyORb
# 5SAYYBW2TEHuqKeZYlqa93CmC6MDA5PXKb+CI9NbkLz8yeQvXxmBVDfyyoqoV2pR
# L5khV5cp9Xnwdpa1XYuKnVjSW4vsyzBvznqPPvNcg2Tv0fhd9tY6vJ/sC1YGOu6z
# byOYdYreBc2GPZK1Vw4jjwNzoIV9cMyj9z8T9pvbXuRNiGKG3asJZ4ZLlMdDdtlX
# H6VQ8toN7eRVeNi/ExhApa7ThBfr69REVJ4vdZWtRI7qcSdm7tfYRhyLkxSaZR0Q
# SIBVk7/TfIuU1ZQ0Zfvb/3j29T7lk32v0QZ2ntfdbuYsvVPHiAuYeesH3s7571Fg
# rrfvQwLnayK5+7XWnefw4bmzbMnDYnoukP4ctvIKB9Eh31DlQqCyPQDVC6gG63wU
# jph1ofexHWmicS/oaw1itPIG1JHvtyxRYtQLJVuiwXf5p7T5Kh8wgga3MIIEn6AD
# AgECAhBi/LXlDGu4Koe2TDSG3A1BMA0GCSqGSIb3DQEBCwUAMFYxCzAJBgNVBAYT
# AlBMMSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAiBgNVBAMT
# G0NlcnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQTAeFw0yMjA4MDgxNTI5MzFaFw0y
# NTA4MDcxNTI5MzBaMF0xCzAJBgNVBAYTAkRFMQ8wDQYDVQQIDAZIZXNzZW4xETAP
# BgNVBAcMCEVzY2hib3JuMRQwEgYDVQQKDAtjZXRlcmlvbiBBRzEUMBIGA1UEAwwL
# Y2V0ZXJpb24gQUcwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDIKiYb
# 6L3yEo2hbJlZz2BzIKqhMlIi7g59KN00wYk4HGQJ6CAi2NOEKStg3IXvcvkh1yE+
# Xka9uY26c4j/hZ9XtcJEyOq7SSRcR9aoxZS8LgGrRkU8d7oNQZdAK1HgzVmEDVmg
# vqWn0NV82iT74hu377JYjv+pms+RSiUTOR+LbA4TGeHxFeCZ94uVtfHdjZMgRSEt
# uEghTajAI9E6mGmyzOt7D2hU8HTytpiVG0RAmieuTY4tD1Kahl2CAeA1oQg+ZrmH
# V5Na1FcZ2jaCbNQA70JZAaC+HhJf4oCFd0ERarpRUsC0VzvMF1LTiOw6tpWbvhQ6
# 79tKz/V/5XCWrqtIAwZumUlMngLxBpb9bsnSBXLCQUIOGZWQQO3zrTMatfm6otV5
# 4EsHupXGYK9lumINNtf2ehyeTa8qUT9pMgdsJJo0oen4eowoj1P/cB4anz6AdF37
# qhrLWb2aNen2Qm7cT8s0dR7GaVu4uBNdlTPXPocGdBnQOkRif2gCJ9NEicKTT14r
# r2wzFJsLPHLAKe/ng85+f9IRA0y++TOrjSp0YpA3aYB0oPcpMy+cu+ShG8mirIvB
# NzXTFm0rF/pSzUeJFyKFGfJOWG82NM2gFlN8Tc5Ud8UUv118x/7nbZQLezSkwSQK
# b1CQtCT3z0F4kwkuiz80YBjGNwPScX191/kdXwIDAQABo4IBeDCCAXQwDAYDVR0T
# AQH/BAIwADA9BgNVHR8ENjA0MDKgMKAuhixodHRwOi8vY2NzY2EyMDIxLmNybC5j
# ZXJ0dW0ucGwvY2NzY2EyMDIxLmNybDBzBggrBgEFBQcBAQRnMGUwLAYIKwYBBQUH
# MAGGIGh0dHA6Ly9jY3NjYTIwMjEub2NzcC1jZXJ0dW0uY29tMDUGCCsGAQUFBzAC
# hilodHRwOi8vcmVwb3NpdG9yeS5jZXJ0dW0ucGwvY2NzY2EyMDIxLmNlcjAfBgNV
# HSMEGDAWgBTddF1MANt7n6B0yrFu9zzAMsBwzTAdBgNVHQ4EFgQUA2C8eX6Zym6M
# ef9rfykA3uttqVYwSwYDVR0gBEQwQjAIBgZngQwBBAEwNgYLKoRoAYb2dwIFAQQw
# JzAlBggrBgEFBQcCARYZaHR0cHM6Ly93d3cuY2VydHVtLnBsL0NQUzATBgNVHSUE
# DDAKBggrBgEFBQcDAzAOBgNVHQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQADggIB
# AEwS2d7VlMJ1nRDpXkUB6/RH3c3vqnMk5KjW7t+ObqiP4um/GVEzarYPUJny1TdU
# V+NZtYe6kxCj8eXQF3qV9nx35gg3LSXSmc0Dff0eRAobj1ZBubgf0lrQXjHJBuCq
# agTFwLmCiamit20aq/Ki21GwslbEv4SLN6vNItlvyCsRt1Ou1f9t5A4jokxZ3rqo
# 5+2YNVV8tlTetQq/APdHyKj89YN1ChzF0Z261pQYBzpg4q1KPB3bIYMjyptiVKBI
# VR+dWemozeGxXgB+9tPhWIzIg0MIylYM66Px6WqVuaiXSvAi3PP1R4/SBxOcruhX
# 2MJycCUk0jT52KsPga+IiBO2CgtZpkeK4keEtHPdTVAaO9W0GRru9DTCJT89Jetq
# 3Kl1YppZaKcmMSmku3pT7kW7AHklg18Qg8nUy5zoU1zXmIt/K/XkuaxIRwHzjIC7
# WwhVfTcXwO9b14PpPynS4Ifdi6ujE7yv+f/f0rg739R5WWrSy2dAb4A3Pf9Zed61
# IDf14sQfteEvHnZC9C4bbm79A/mVyY8a2UcJAL0VPLZLZMIYeaoYEVUbXCa14vYV
# SSn1I/viAuth+iGYfG7iYXb5LjICKLyk/l2oL0BYIgRoeFzqM6En7v1/dA6Tk4t3
# 9NK7sSIjERtFMnj3YN2tZHJ3dubAxNb6mEFOdkuszq9LMIIGuTCCBKGgAwIBAgIR
# AJmjgAomVTtlq9xuhKaz6jkwDQYJKoZIhvcNAQEMBQAwgYAxCzAJBgNVBAYTAlBM
# MSIwIAYDVQQKExlVbml6ZXRvIFRlY2hub2xvZ2llcyBTLkEuMScwJQYDVQQLEx5D
# ZXJ0dW0gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxJDAiBgNVBAMTG0NlcnR1bSBU
# cnVzdGVkIE5ldHdvcmsgQ0EgMjAeFw0yMTA1MTkwNTMyMThaFw0zNjA1MTgwNTMy
# MThaMFYxCzAJBgNVBAYTAlBMMSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1z
# IFMuQS4xJDAiBgNVBAMTG0NlcnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQTCCAiIw
# DQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJ0jzwQwIzvBRiznM3M+Y116dbq+
# XE26vest+L7k5n5TeJkgH4Cyk74IL9uP61olRsxsU/WBAElTMNQI/HsE0uCJ3VPL
# O1UufnY0qDHG7yCnJOvoSNbIbMpT+Cci75scCx7UsKK1fcJo4TXetu4du2vEXa09
# Tx/bndCBfp47zJNsamzUyD7J1rcNxOw5g6FJg0ImIv7nCeNn3B6gZG28WAwe0mDq
# LrvU49chyKIc7gvCjan3GH+2eP4mYJASflBTQ3HOs6JGdriSMVoD1lzBJobtYDF4
# L/GhlLEXWgrVQ9m0pW37KuwYqpY42grp/kSYE4BUQrbLgBMNKRvfhQPskDfZ/5Gb
# TCyvlqPN+0OEDmYGKlVkOMenDO/xtMrMINRJS5SY+jWCi8PRHAVxO0xdx8m2bWL4
# /ZQ1dp0/JhUpHEpABMc3eKax8GI1F03mSJVV6o/nmmKqDE6TK34eTAgDiBuZJzeE
# PyR7rq30yOVw2DvetlmWssewAhX+cnSaaBKMEj9O2GgYkPJ16Q5Da1APYO6n/6wp
# Cm1qUOW6Ln1J6tVImDyAB5Xs3+JriasaiJ7P5KpXeiVV/HIsW3ej85A6cGaOEpQA
# 2gotiUqZSkoQUjQ9+hPxDVb/Lqz0tMjp6RuLSKARsVQgETwoNQZ8jCeKwSQHDkpw
# FndfCceZ/OfCUqjxAgMBAAGjggFVMIIBUTAPBgNVHRMBAf8EBTADAQH/MB0GA1Ud
# DgQWBBTddF1MANt7n6B0yrFu9zzAMsBwzTAfBgNVHSMEGDAWgBS2oVQ5AsOgP46K
# vPrU+Bym0ToO/TAOBgNVHQ8BAf8EBAMCAQYwEwYDVR0lBAwwCgYIKwYBBQUHAwMw
# MAYDVR0fBCkwJzAloCOgIYYfaHR0cDovL2NybC5jZXJ0dW0ucGwvY3RuY2EyLmNy
# bDBsBggrBgEFBQcBAQRgMF4wKAYIKwYBBQUHMAGGHGh0dHA6Ly9zdWJjYS5vY3Nw
# LWNlcnR1bS5jb20wMgYIKwYBBQUHMAKGJmh0dHA6Ly9yZXBvc2l0b3J5LmNlcnR1
# bS5wbC9jdG5jYTIuY2VyMDkGA1UdIAQyMDAwLgYEVR0gADAmMCQGCCsGAQUFBwIB
# FhhodHRwOi8vd3d3LmNlcnR1bS5wbC9DUFMwDQYJKoZIhvcNAQEMBQADggIBAHWI
# WA/lj1AomlOfEOxD/PQ7bcmahmJ9l0Q4SZC+j/v09CD2csX8Yl7pmJQETIMEcy0V
# ErSZePdC/eAvSxhd7488x/Cat4ke+AUZZDtfCd8yHZgikGuS8mePCHyAiU2VSXgo
# Q1MrkMuqxg8S1FALDtHqnizYS1bIMOv8znyJjZQESp9RT+6NH024/IqTRsRwSLrY
# kbFq4VjNn/KV3Xd8dpmyQiirZdrONoPSlCRxCIi54vQcqKiFLpeBm5S0IoDtLoIe
# 21kSw5tAnWPazS6sgN2oXvFpcVVpMcq0C4x/CLSNe0XckmmGsl9z4UUguAJtf+5g
# E8GVsEg/ge3jHGTYaZ/MyfujE8hOmKBAUkVa7NMxRSB1EdPFpNIpEn/pSHuSL+kW
# N/2xQBJaDFPr1AX0qLgkXmcEi6PFnaw5T17UdIInA58rTu3mefNuzUtse4AgYmxE
# mJDodf8NbVcU6VdjWtz0e58WFZT7tST6EWQmx/OoHPelE77lojq7lpsjhDCzhhp4
# kfsfszxf9g2hoCtltXhCX6NqsqwTT7xe8LgMkH4hVy8L1h2pqGLT2aNCx7h/F95/
# QvsTeGGjY7dssMzq/rSshFQKLZ8lPb8hFTmiGDJNyHga5hZ59IGynk08mHhBFM/0
# MLeBzlAQq1utNjQprztZ5vv/NJy8ua9AGbwkMWkOMIIGuTCCBKGgAwIBAgIRAOf/
# acc7Nc5LkSbYdHxopYcwDQYJKoZIhvcNAQEMBQAwgYAxCzAJBgNVBAYTAlBMMSIw
# IAYDVQQKExlVbml6ZXRvIFRlY2hub2xvZ2llcyBTLkEuMScwJQYDVQQLEx5DZXJ0
# dW0gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxJDAiBgNVBAMTG0NlcnR1bSBUcnVz
# dGVkIE5ldHdvcmsgQ0EgMjAeFw0yMTA1MTkwNTMyMDdaFw0zNjA1MTgwNTMyMDda
# MFYxCzAJBgNVBAYTAlBMMSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMu
# QS4xJDAiBgNVBAMTG0NlcnR1bSBUaW1lc3RhbXBpbmcgMjAyMSBDQTCCAiIwDQYJ
# KoZIhvcNAQEBBQADggIPADCCAgoCggIBAOkSHwQ17bldesWmlUG+imV/TnfRbSV1
# 02aO2/hhKH9/t4NAoVoipzu0ePujH67y8iwlmWuhqRR4xLeLdPxolEL55CzgUXQa
# q+Qzr5Zk7ySbNl/GZloFiYwuzwWS2AVgLPLCZd5DV8QTF+V57Y6lsdWTrrl5dEeM
# fsxhkjM2eOXabwfLy6UH2ZHzAv9bS/SmMo1PobSx+vHWST7c4aiwVRvvJY2dWRYp
# TipLEu/XqQnqhUngFJtnjExqTokt4HyzOsr2/AYOm8YOcoJQxgvc26+LAfXHiBkb
# QkBdTfHak4DP3UlYolICZHL+XSzSXlsRgqiWD4MypWGU4A13xiHmaRBZowS8FET+
# QAbMiqBaHDM3Y6wohW07yZ/mw9ZKu/KmVIAEBhrXesxifPB+DTyeWNkeCGq4IlgJ
# r/Ecr1px6/1QPtj66yvXl3uauzPPGEXUk6vUym6nZyE1IGXI45uGVI7XqvCt99Wu
# D9LNop9Kd1LmzBGGvxucOo0lj1M3IRi8FimAX3krunSDguC5HgD75nWcUgdZVjm/
# R81VmaDPEP25Wj+C1reicY5CPckLGBjHQqsJe7jJz1CJXBMUtZs10cVKMEK3n/xD
# 2ku5GFWhx0K6eFwe50xLUIZD9GfT7s/5/MyBZ1Ep8Q6H+GMuudDwF0mJitk3G8g6
# EzZprfMQMc3DAgMBAAGjggFVMIIBUTAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQW
# BBS+VAIvv0Bsc0POrAklTp5DRBru4DAfBgNVHSMEGDAWgBS2oVQ5AsOgP46KvPrU
# +Bym0ToO/TAOBgNVHQ8BAf8EBAMCAQYwEwYDVR0lBAwwCgYIKwYBBQUHAwgwMAYD
# VR0fBCkwJzAloCOgIYYfaHR0cDovL2NybC5jZXJ0dW0ucGwvY3RuY2EyLmNybDBs
# BggrBgEFBQcBAQRgMF4wKAYIKwYBBQUHMAGGHGh0dHA6Ly9zdWJjYS5vY3NwLWNl
# cnR1bS5jb20wMgYIKwYBBQUHMAKGJmh0dHA6Ly9yZXBvc2l0b3J5LmNlcnR1bS5w
# bC9jdG5jYTIuY2VyMDkGA1UdIAQyMDAwLgYEVR0gADAmMCQGCCsGAQUFBwIBFhho
# dHRwOi8vd3d3LmNlcnR1bS5wbC9DUFMwDQYJKoZIhvcNAQEMBQADggIBALiTWXfJ
# TBX9lAcIoKd6oCzwQZOfARQkt0OmiQ390yEqMrStHmpfycggfPGlBHdMDDYhHDVT
# GyvY+WIbdsIWpJ1BNRt9pOrpXe8HMR5sOu71AWOqUqfEIXaHWOEs0UWmVs8mJb4l
# KclOHV8oSoR0p3GCX2tVO+XF8Qnt7E6fbkwZt3/AY/C5KYzFElU7TCeqBLuSagmM
# 0X3Op56EVIMM/xlWRaDgRna0hLQze5mYHJGv7UuTCOO3wC1bzeZWdlPJOw5v4U1/
# AljsNLgWZaGRFuBwdF62t6hOKs86v+jPIMqFPwxNJN/ou22DqzpP+7TyYNbDocrT
# hlEN9D2xvvtBXyYqA7jhYY/fW9edUqhZUmkUGM++Mvz9lyT/nBdfaKqM5otK0U5H
# 8hCSL4SGfjOVyBWbbZlUIE8X6XycDBRRKEK0q5JTsaZksoKabFAyRKJYgtObwS1U
# PoDGcmGirwSeGMQTJSh+WR5EXZaEWJVA6ZZPBlGvjgjFYaQ0kLq1OitbmuXZmX7Z
# 70ks9h/elK0A8wOg8oiNVd3o1bb59ms1QF4OjZ45rkWfsGuz8ctB9/leCuKzkx5R
# t1WAOsXy7E7pws+9k+jrePrZKw2DnmlNaT19QgX2I+hFtvhC6uOhj/CgjVEA4q1i
# 1OJzpoAmre7zdEg+kZcFIkrDHgokA5mcIMK1MYIHIjCCBx4CAQEwajBWMQswCQYD
# VQQGEwJQTDEhMB8GA1UEChMYQXNzZWNvIERhdGEgU3lzdGVtcyBTLkEuMSQwIgYD
# VQQDExtDZXJ0dW0gQ29kZSBTaWduaW5nIDIwMjEgQ0ECEGL8teUMa7gqh7ZMNIbc
# DUEwDQYJYIZIAWUDBAIBBQCggYQwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZ
# BgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYB
# BAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgmvQQXiuV3BPPiJ+gjtZHUg7xpZo8q2S/
# 8Kly1Sj/BkowDQYJKoZIhvcNAQEBBQAEggIAuZjty+HO/QonHMF7B4RF7bJrbtOO
# J49Ggpnxz95S9Ga2tvc6+WdBhvlIyLwMhL151helRcGO4k+lbXJhyzmI7zqSZfl3
# e02IkXE8sq+HbWF9qwbD8XMH0d/r4OpeW8FUqO+9iCmVvWcHu0cGjjO7P4LKYpj6
# Bs0crHB8eqXFM+Gm1kquTIh6evYvB03s3IDpDzLfmDcmfUgJBOUbpb8PFeC53tku
# E1oSAcbCxqPdGmsVQgtm7WDA19yUFKGRmcPbBZl0SmFjPO5f3+ktKuy6FMDsRXaJ
# zWXhi3abKOKHWqjvRcFubG7uTmT1uTkJuP/DZsvxLreqlD63AR8ejZCPsSXBtQkR
# osoz77FhpNanrUsWQEpN8JkV+NFoBI9NXciked9N09A8xtk4/lPI8ZZk3UvIihNk
# llIZUsj/cb3liX4c+LxZmFxLrr45m6K3+pJ2XPMT9Zzu7azX6Ocb+hFI08r48EMU
# DGbHIE4u2jF8Yq27ieXsdO5eGkttRGrr59HbGmvsq/tnjAeJDznAwdvH9jMZFbht
# 2KPj22IiZMeKKTigNRjiU+T5P4z9w4s5HJopdBJQmMPdOLzbi9+t3k10Xy77FO0O
# pwepmc5pXZ5wIdXvpUiJh3Bdq3sVlVtUOn0fzYQDvuz0QCv4tiMutk+qgH2M9grg
# L3A8B3FAXjDADimhggQCMIID/gYJKoZIhvcNAQkGMYID7zCCA+sCAQEwajBWMQsw
# CQYDVQQGEwJQTDEhMB8GA1UEChMYQXNzZWNvIERhdGEgU3lzdGVtcyBTLkEuMSQw
# IgYDVQQDExtDZXJ0dW0gVGltZXN0YW1waW5nIDIwMjEgQ0ECEAnFzPi7Zn1xN6rB
# WYAGyzEwDQYJYIZIAWUDBAICBQCgggFWMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0B
# CRABBDAcBgkqhkiG9w0BCQUxDxcNMjQwNDI0MDYyNTQ3WjA3BgsqhkiG9w0BCRAC
# LzEoMCYwJDAiBCDqlUux0EC0MUBI2GWfj2FdiHQszOBnkuBWAk1LADrTHDA/Bgkq
# hkiG9w0BCQQxMgQwdquqUwEjplUYowuTJTLcfLnYFi33o++kGGL+/7J3mTQnmS/v
# h584giDA5nu1eY7mMIGfBgsqhkiG9w0BCRACDDGBjzCBjDCBiTCBhgQUD0+4VR7/
# 2Pbef2cmtDwT0Gql53cwbjBapFgwVjELMAkGA1UEBhMCUEwxITAfBgNVBAoTGEFz
# c2VjbyBEYXRhIFN5c3RlbXMgUy5BLjEkMCIGA1UEAxMbQ2VydHVtIFRpbWVzdGFt
# cGluZyAyMDIxIENBAhAJxcz4u2Z9cTeqwVmABssxMA0GCSqGSIb3DQEBAQUABIIC
# ACvqMd5ACl4514dzZQanCuddhUvz5/8qyZ+FxdX6DW0z+U6HSySLvpHZ1Wf3Sb8A
# OY0IIr33e2LpBN0YMdsihMUXfIMOpxrYsWlTE6jjiFjYSL7QHm2uEWI2DHmm3V+G
# kp+iTmYBMP+CB2n627LQmhHN28gtMgK1DgHn5ddlG3PL9cLqvHiZAly9JwRRlJFJ
# B2kzLa+CWJVYCLKu3D0RTGS8ZXcIZaVb7PY7x/ge4mAjJAP0OCNPvaaiaxiVFG7i
# ZbzUbip3UUeP/5U0315cxN5fp9v+wdEeCAqP6zvq5pfnf6syFrcZNaVQYvUC1LMU
# WfcxuHcY8A2IMRZ6xOB2fK0h1vqVNDWeob3JUzPNzbNosfHtmVczV2ak+SLlPY/Z
# tjrP/SA4ja7fvkaQoJVI4jmF1axSiw6B3g8v7znN/gO6f6z63ZSy/9nryIiLtWGy
# 2lkzw6pOfhocU76SkYztxQ2EUxmSyOGy7s1chy6CDob+obd5sKQw8v3mlKC181+5
# 2GpEgDWzVlLiwgsSPKB/yUIKAq/sijPu63yDRMLGDTjYPN+ips0WNbAhlapWtSNa
# HlRjIsQ+PLnuGDQvNKwbLZ34vGB+6LiAifFSdvJWjh6fnzgyVtXqKC9Hqh4gkNdX
# CpJNocpahuyp6FcQjsl3lEgr6kw7Aajsg90Fbj3Uw0Uv
# SIG # End signature block
