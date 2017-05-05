# CallAction

CallAction is a mobile web application to automate the tracking and engagement of inbound calls across all marketing channels.

This gem is ruby wrapper for [CallAction](https://callaction.co/) API. It is open source and developed independently to help rails developers CallAction api integration.

  - Track Every Inbound Call
  - Build Your Lead Database
  - Answer Every Call

### Supported Rubies

CallAction supports and is tested against the following Ruby versions:

  - 1.9.3
  - 2.0.0
  - 2.2.0
  - 2.3.0
  
CallAction may work just fine with a Ruby version not listed above, but we can't guarantee that it will. If you'd like to maintain a Ruby that isn't listed, please let us know with a pull request.

### Installation

Add call_action gem to your Gemfile

```sh
gem 'call_action'
```
and than execute following command on console

```sh
$ bundle install
```

Generate configuration file using 

```sh
rails generate call_action:install
```

It would generate call_action.rb file inside initializers folder of your application. Here you need to specify api version (current version is v1) and your auth token

### Usage

Please refer to [Official Documentation](https://callaction.co/documentation/developers/api/v1/index.html) to get list of all available API calls with details. 

After installing gem, You can communicate to call_action using API class

#### Contacts

To get list of all contacts, call contacts method on call_action object

```sh
call_action = CallAction::Api.new
@contacts = call_action.contacts
@contact = @contacts.campaign_name
```

To get contact attribute

```sh
puts @contact.caller_id_name
puts @contact.caller_id_c
```


#### Activities

To get list of all activities by particular contact

```sh
@activities = call_action.activities(@contact.id)
```

Or you can directly access activities using activities method

```sh
@activities = @contact.activities
```

#### Channels

Get list of all channels using channels method

```sh
call_action = CallAction::Api.new
@channels = call_action.channels
```

#### Sources

Get list of all sources using sources method

```sh
call_action = CallAction::Api.new
@sources = call_action.sources
```
### Contribution

You can contribute by making pull request and develop some owesome feature to help open source community

### Todos

 - Multiple accounts
 - Ability to switch Auth-Token at run time

License
----

MIT

**Free Software, Hell Yeah!**
