require 'lspconfig'.phpactor.setup {
	cmd = { 'phpactor', 'language-server', '-vvv' },
	root_dir = function(startPath)
		print("root_dir running"); -- just to confirm this works; it does.
		local rp = (require 'lspconfig.util').root_pattern
		for _, pattern in pairs({ ".thisIsDocRoot", "index.php", ".git", "node_modules", "index.php", "composer.json" })
		do
			local found = rp({ pattern })(startPath)
			print(pattern, found) -- this works
			if (found and found ~= '') then return found end
		end
		return nil
	end,
}
