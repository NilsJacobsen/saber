// @ts-check

/**
 * @type { import("@inlang/core/config").DefineConfig }
 */
export async function defineConfig(env) {
  const plugin = await env.$import(
    "https://cdn.jsdelivr.net/gh/samuelstroschein/inlang-plugin-json@1/dist/index.js"
  );

  const { standardLintRules } = await env.$import(
    "https://cdn.jsdelivr.net/gh/inlang/standard-lint-rules@1/dist/index.js"
  );

  const pluginConfig = {
    pathPattern: "./lib/i18n/community/{language}.json",
  };

  return {
    referenceLanguage: "strings_en.i18n",
    languages: await plugin.getLanguages({ ...env, pluginConfig }),
    readResources: (args) => plugin.readResources({ ...args, ...env, pluginConfig }),
    writeResources: (args) => plugin.writeResources({ ...args, ...env, pluginConfig }),
    lint: {
      rules: [standardLintRules()],
    },
  };
}
