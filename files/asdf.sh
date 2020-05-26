if [ -s "${HOME}/.asdf/bin" ]; then
  asdf_root="${HOME}/.asdf"
fi

if [ -n "$asdf_root" ]; then
  export PATH="${asdf_root}/bin:${asdf_root}/shims:$PATH"
  source "${asdf_root}/asdf.sh"
  source "${asdf_root}/completions/asdf.bash"
fi
