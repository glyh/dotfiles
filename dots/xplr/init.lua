version = '0.20.2'

xplr.config.modes.builtin.default.key_bindings.on_key["X"] = {
  help = "open",
  messages = {
    {
      BashExecSilently0 = [===[
        xdg-open "${XPLR_FOCUS_PATH:?}"
      ]===],
    },
  },
}


xplr.config.modes.builtin.default.key_bindings.on_key[";"] =  {
  help = "action",
  messages = {"PopMode", {SwitchModeBuiltin = "action"}}
}

--[[ xplr.config.modes.builtin.default.key_bindings.on_key["e"] =  {
  help = "action",
  messages = {"PopMode", {SwitchModeBuiltin = "action"}}
} ]]
