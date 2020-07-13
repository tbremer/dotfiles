local OLD_EMAIL CORRECT_EMAIL SHOULD_PUSH
echo -n "Old Email: "
read OLD_EMAIL

echo -n "Correct email: "
read CORRECT_EMAIL

echo -n "Should push changes [Y/n]: "
read SHOULD_PUSH
SHOULD_PUSH=${SHOULD_PUSH:-Y}

local CMD="git filter-branch -f --env-filter ' \
	if [ "\$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]; \
	then \
		export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"; \
		fi; \
		if [ "\$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]; then \
			export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"; \
			fi' --tag-name-filter cat -- --branches --tags"

eval $CMD

if [ "$SHOULD_PUSH" = "Y" ]; then
	git push --force --tags origin 'refs/heads/*'
fi
