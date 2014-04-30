iOS-Device-Info
===============

Using MobileGestalt As Private API.
include DeviceInfo.h And Follow Some Other Tips Inside It.
Call something like [ID uniqueIdentifier]in your Progamme to get your demanded info.
Doesn't Work Inside Sandboxd Apps unless the Binary is signed with special entitlements.
Working On A System Daemon the fix that.
Pull Requests Are Favoured
===============
USE ldid -e BINARY>>entitle.xml TO DUMP THE ENTITLEMENTS OF THE BINARY.ADD CONTENTS OF Entitlements.xml PROVIDED INTO entitle.xml
AND USE ldid -Sentitle.xml BINARY to sign the entitlements back.
This Must Be Done,Recommend Using PRE-Install Script.
Not Doing So With Cause Your Call RETURNS NIL.
