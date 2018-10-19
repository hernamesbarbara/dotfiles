module.exports = {
  "env": {
    "browser": true,
    "es6": true,
    "node": true
  },
  "extends": "eslint:recommended",
  "parserOptions": {
    "ecmaVersion": 2018,
    "sourceType": "module"
  },
  "rules": {
    "indent": [
      "error",
      2
    ],
    "linebreak-style": [
      "error",
      "unix"
    ],
    "quotes": [
      "error",
      "single"
    ],
    "semi": [
      "error",
      "always"
    ],
    // disallow declaration of variables that are not used in the code
    "no-unused-vars": [
      "warn", {
        "vars": "all",
        "args": "after-used",
        "ignoreRestSiblings": true
      }
    ],
    "no-console": [process.env.NODE_ENV === "production" ? "error" : "warn"],
    "no-debugger": [process.env.NODE_ENV === "production" ? "error" : "warn"]
  }
};
