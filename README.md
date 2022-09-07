# metamask-utils

## Build

```console
shell:~ $ DEBUG=metamask:*,eth-query DEBUG_COLORS=1 ENABLE_MV3=true \
    node development/build/index.js dist --build-type=main --apply-lavamoat=false
```

## ENV

```bash
export SENTRY_DSN_DEV=https://fake@sentry.io/0000000 
SENTRY_DSN_DEV=https://{SENTRY_PUBLIC_KEY}@sentry.io/{SENTRY_PROJECT_ID}
SENTRY_DSN=https://{SENTRY_PUBLIC_KEY}@sentry.io/{SENTRY_PROJECT_ID}
```
```console
yarn build test --build-type flask

ENABLE_MV3=true yarn build test
DEBUG=metamask:*,eth-query DEBUG_COLORS=1 ENABLE_MV3=true 
```

```bash
#!bin/bash

nvm use 16 
export METAMASK_ENV='test'
export PASSWORD='correct horse battery staple'
export INFURA_PROJECT_ID='51f84cc2f3374b388939ef48c00e87ac'
export SENTRY_DSN_DEV='https://4612daebacb547b5995bdf2a3cc67156@o1029417.ingest.sentry.io/6291435'
export ENABLE_MV3=true
export DEBUG=metamask:*

#setup
yarn install && yarn setup:postinstall

yarn patch-package && yarn allow-scripts && DEBUG=metamask:*,eth-query DEBUG_COLORS=1 ENABLE_MV3=true node development/build/index.js dist --apply-lavamoat=false
```

```console
Build the MetaMask extension.

Positionals:
  task  The task to run. There are a number of main tasks, each of which calls
        other tasks internally. The main tasks are:

        dev: Create an unoptimized, live-reloading build for local development.

        dist: Create an optimized production-like for a non-production
        environment.

        prod: Create an optimized build for a production environment.

        test: Create an optimized build for running e2e tests.

        testDev: Create an unoptimized, live-reloading build for debugging e2e
        tests.                                                          [string]

Options:
  --version           Show version number                              [boolean]
  --help              Show help                                        [boolean]
  --apply-lavamoat    Whether to use LavaMoat. Setting this to `false` can be
                      useful during development if you want to handle LavaMoat
                      errors later.                    [boolean] [default: true]
  --build-type        The type of build to create.
                            [choices: "beta", "flask", "main"] [default: "main"]
  --build-version     The build version. This is set only for non-main build
                      types. The build version is used in the "prerelease"
                      segment of the extension version, e.g.
                      `[major].[minor].[patch]-[build-type].[build-version]`
                                                           [number] [default: 0]
  --lint-fence-files  Whether files with code fences should be linted after
                      fences have been removed. The build will fail if linting
                      fails. This defaults to `false` if the entry task is `dev`
                      or `testDev`. Otherwise this defaults to `true`. [boolean]
  --lockdown          Whether to include SES lockdown files in the extension
                      bundle. Setting this to `false` can be useful during
                      development if you want to handle lockdown errors later.
                                                       [boolean] [default: true]
  --policy-only       Stop the build after generating the LavaMoat policy,
                      skipping any writes to disk other than the LavaMoat policy
                      itself.                         [boolean] [default: false]


```

