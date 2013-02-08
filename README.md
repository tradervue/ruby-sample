Tradervue API Sample Application
================================

This is a simple Ruby application that uses the [Tradervue API](https://github.com/tradervue/api-docs)
to import some trade data. It also queries the import status before and after the import, to help
give you an idea how the status works.

To use the application, first install HTTParty:

`gem install httparty`

Change the example username and password in main.rb to be your own Tradervue username/password.
Then you can run the sample:

`ruby main.rb`

This will import two trade executions.

This sample isn't intended to show best practices - it's just a trivial example of an app that uses
the Tradervue API.
