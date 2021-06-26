#!/bin/sh
if [ "$1" = "gatsby" ]; then

  if [ ! -f "package.json" ]; then

    echo "No project found at /app. Creating a new gatsby project"

    DOCKER=true gatsby new . https://github.com/gatsbyjs/gatsby-starter-default

  elif [ ! -d "node_modules" ] || [ ! "$(ls -qAL node_modules 2>/dev/null)" ]; then

    echo "Node modules not installed. Installing..."

    if [ -f "yarn.lock" ]; then

      yarn install

    else

      npm install

    fi

  fi

fi

echo "Starting your app..."

exec "$@"
