local wilder_setup, wilder = pcall(require, "wilder")

if not wilder_setup then
	return
end

wilder.setup({
	modes = { ":", "/", "?" },
})
