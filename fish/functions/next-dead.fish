function next-dead;
  find . -name '.next' -type d -exec rm -rf {} +
end;