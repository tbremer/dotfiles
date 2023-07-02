globalThis.useCookie = function useCookie(c) {
  return c
    .split(";")
    .map((c) =>
      c
        .trim()
        .split("=")
        .map((i) => i.trim())
    )
    .reduce((a, c) => ({ ...a, [c[0]]: c[1] }), {});
};
