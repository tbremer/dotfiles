function modules-dead;
  find . -name 'node_modules' -type d -exec rm -rf {} +
end;