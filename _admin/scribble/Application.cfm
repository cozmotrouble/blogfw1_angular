 <cfapplication clientmanagement="true" clientstorage="cookie" name="test" sessionmanagement="true">
<cfset application.customTagPaths = GetDirectoryFromPath(GetCurrentTemplatePath()) & "customtags">
