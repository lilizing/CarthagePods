require 'Clamp'
require 'ENV/DependencyCheck'
require 'CPod/CPodManage'
require 'Command/UpdateCommand'
require 'Command/BuildCommand'

module CarthagePods

  class MainCommand < Clamp::Command

    DependencyCheck.checkEnv

    subcommand "init", "Generate a Podfile and Cartfile for the current directory " do
      def execute

        carthageManage = CarthageManage.new
        cpodManage = CPodManage.new

        cpodManage.createCPodfile
        carthageManage.createCartfile
        `pod init`
      end

    end

    subcommand 'install', 'Install project dependencies', InstallCommand

    subcommand 'update', 'Update outdated project dependencies', UpdateCommand

  end

end


