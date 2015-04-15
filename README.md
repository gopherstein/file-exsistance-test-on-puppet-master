<snippet>
  <content>
  #file-exsistance-test-on-puppet-master

  TODO: Add error checking and possibly tests.

  ## Installation

  put this script in your puppet module under:

  <your module>/lib/puppet/parser/exists.rb

  ## Usage

  You can use this to determine if a file exsists on the puppet master.
  This is extreamly useful if you need to access templates or files from a hierarchy.

  i.e. <your module>/templates/domains/domain1.com/database.yml
       vs.
       <your module>/templates/domains/domain2.com/database.yml


  Here is an example of how you would call it in a manifest file.

   if exists("/etc/puppet/environments/${environment}/modules/<your module>/templates/${domain}/${environment}/database.yml"){
    file { "database.yml":
      path    => "/data/${application}/shared/config/database.yml",
      owner   => 'deploy',
      group   => 'deploy',
      content => template("<your module>/${domain}/${environment}/database.yml"),
    }
  }
 
 Here, you can see that the file method will only be called if the template exists. Otherwise it will ignore the template.




  ## Contributing

  1. Fork it!
  2. Create your feature branch: `git checkout -b my-new-feature`
  3. Commit your changes: `git commit -am 'Add some feature'`
  4. Push to the branch: `git push origin my-new-feature`
  5. Submit a pull request :D
