-- Configuración de jdtls para proyectos Java/Android con Gradle
-- Este archivo se ejecuta automáticamente al abrir archivos .java

local jdtls = require("jdtls")

-- Detectar directorio del proyecto (crea workspace separado por proyecto)
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

-- Paths importantes
local mason_path = vim.fn.stdpath("data") .. "/mason"
local jdtls_path = mason_path .. "/packages/jdtls"
local config_path = jdtls_path .. "/config_linux"
local plugins_path = jdtls_path .. "/plugins"

-- Encontrar el JAR del language server (glob para versión dinámica)
local launcher_jar = vim.fn.glob(plugins_path .. "/org.eclipse.equinox.launcher_*.jar")

-- Si no se encuentra el JAR, mostrar error y salir
if launcher_jar == "" then
	vim.notify(
		"jdtls no está instalado correctamente. Ejecuta: :MasonInstall jdtls",
		vim.log.levels.ERROR
	)
	return
end

-- Configuración de jdtls
local config = {
	-- Comando para iniciar el language server
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens", "java.base/java.util=ALL-UNNAMED",
		"--add-opens", "java.base/java.lang=ALL-UNNAMED",
		"-jar", launcher_jar,
		"-configuration", config_path,
		"-data", workspace_dir,
	},

	-- Directorio raíz del proyecto (busca build.gradle, pom.xml, etc.)
	root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew", "pom.xml", "build.gradle"}),

	-- Configuración específica del servidor
	settings = {
		java = {
			signatureHelp = { enabled = true },
			contentProvider = { preferred = "fernflower" },
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
				filteredTypes = {
					"com.sun.*",
					"io.micrometer.shaded.*",
					"java.awt.*",
					"jdk.*",
					"sun.*",
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				useBlocks = true,
				-- Desactivar sugerencias de generación de código en code actions
				generateComments = false,
				hashCodeEquals = {
					useJava7Objects = true,
					useInstanceof = true,
				},
			},
			-- Desactivar acciones de generación automática de código
			codeAction = {
				-- Deshabilitar sugerencias de snippets en code actions
				disabledSources = {
					"Generate Getters and Setters",
					"Generate toString()",
					"Generate hashCode() and equals()",
					"Generate Constructor",
					"Generate Delegate Methods",
				},
			},
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = "/usr/lib/jvm/java-21-openjdk/",
					},
				},
			},
		},
	},

	-- Capacidades de autocompletado (integración con nvim-cmp)
	capabilities = require("cmp_nvim_lsp").default_capabilities(),

	-- Función que se ejecuta cuando el LSP se conecta al buffer
	on_attach = function(client, bufnr)
		-- Keymaps específicos de Java (opcional, ya tienes keymaps globales)
		local opts = { noremap = true, silent = true, buffer = bufnr }
		
		-- Organizar imports
		vim.keymap.set("n", "<leader>oi", function() require("jdtls").organize_imports() end, opts)
		
		-- Extraer variable/constante/método
		vim.keymap.set("n", "<leader>ev", function() require("jdtls").extract_variable() end, opts)
		vim.keymap.set("v", "<leader>ev", function() require("jdtls").extract_variable(true) end, opts)
		vim.keymap.set("v", "<leader>em", function() require("jdtls").extract_method(true) end, opts)
		
		-- Override <leader>. para filtrar code actions de generación de código
		vim.keymap.set("n", "<leader>.", function()
			vim.lsp.buf.code_action({
				filter = function(action)
					local title = action.title or ""
					-- Filtrar acciones de generación de código
					return not (
						title:match("^Generate") or
						title:match("getter") or
						title:match("setter") or
						title:match("toString") or
						title:match("hashCode") or
						title:match("equals") or
						title:match("constructor") or
						title:match("delegate")
					)
				end
			})
		end, opts)
		
		print("jdtls conectado correctamente al buffer " .. vim.fn.bufname(bufnr))
	end,
}

-- Iniciar o conectar al servidor jdtls
jdtls.start_or_attach(config)
