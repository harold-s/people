pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        sh '''echo 'Rubocop'
bundle exec rubocop -R .
'''
        echo 'Rubocop'
      }
    }
    stage('Test Setup') {
      steps {
        parallel(
          "Test Setup": {
            sh '''echo 'RSpec Setup'
bundle exec rake db:drop db:setup db:migrate
'''
            
          },
          "Rails Best Practices": {
            sh '''echo 'Rails Best Practices'
echo 'Skipping for now'
# bundle exec rails_best_practices'''
            
          },
          "Brakeman": {
            sh 'bundle exec brakeman -Aqz -4'
            
          }
        )
      }
    }
    stage('Backend Tests') {
      steps {
        parallel(
          "Backend Tests": {
            sh '''echo 'RSpec'
bundle exec rspec spec'''
            
          },
          "Backend Tests (Old)": {
            sh '''echo 'RSpec (Old)'
bundle exec rspec --options .rspec.old spec.old'''
            
          },
          "Frontend Tests": {
            sh '''echo 'Frontend Tests'
bundle exec rake jasmine:ci JASMINE_CONFIG_PATH=./spec.old/javascripts/support/jasmine.yml ./spec.old/javascripts'''
            
          }
        )
      }
    }
  }
}