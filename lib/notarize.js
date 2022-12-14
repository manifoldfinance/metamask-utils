// macOS Entitlements
const fs = require('node:fs')
const path = require('node:path')
const electronNotarize = require('electron-notarize')

module.exports = async function (params) {
  if (process.platform !== 'darwin') return // Only notarize the app on macOS
  const appId = 'sh.frame.app' // Same appId in electron-builder
  const appPath = path.join(params.appOutDir, `${params.packager.appInfo.productFilename}.app`)
  if (!fs.existsSync(appPath)) throw new Error(`Cannot find application at: ${appPath}`)
  console.log(`Notarizing ${appId} found at ${appPath}`)
  try {
    await electronNotarize.notarize({
      appBundleId: appId,
      appPath: appPath,
      appleId: process.env.APPLE_ID,
      appleIdPassword: process.env.APPLE_ID_PASSWORD
    })
  } catch (error) {
    console.error(error)
  }
  console.log(`Done notarizing ${appId}`)
}
