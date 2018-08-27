##### Beginning of file

const PREDICTMD_VERSION = try
    convert(VersionNumber, "v0.20.0-DEV")
catch e
    Compat.@warn("While creating PredictMD.PREDICTMD_VERSION, ignoring error $(e)")
    VersionNumber(0)
end

##### End of file
