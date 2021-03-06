# frozen_string_literal: true

class Ability
    include CanCan::Ability

    def initialize(user)
        if user.privilege == "administrador"
          can :manage, :all
          
        elsif user.privilege == "manager"
            #CAN
            can :create, Project
            can :update, Project
            can :manage, Project::Phase
            
            can :manage, Project::Team do |team|
                team.project.users_id == user.id
            end

            can :manage, Project::Phase::Activity
            can :manage, Project::Phase::Milestone
            can :update, Project::Phase::Milestone::Note do |note|
                note.user == user
            end
                        
            #CAN NOT
            cannot :manage, User
            cannot :destroy, Project

        elsif user.privilege == "operador"
            #CAN
            can :update, Project
            can :manage, Project::Team do |team|
                team.project.users_id == user.id
            end
            can :update, Project::Phase::Milestone::Note do |note|
                note.user == user
            end
            can :destroy, Project::Phase::Milestone::Note do |note|
                note.user == user
            end
            #CAN NOT
            cannot :manage, User
            cannot :create, Project
            cannot :manage, Project::Phase
            #cannot :manage, Project::Team
            cannot :manage, Project::Phase::Milestone
            cannot :manage, Project::Phase::Activity
            #cannot :manage, Project::Phase::Milestone::Note

        end
 
        # Define abilities for the passed in user here. For example:
        #
        #   user ||= User.new # guest user (not logged in)
        #   if user.admin?
        #     can :manage, :all
        #   else
        #     can :read, :all
        #   end
        #
        # The first argument to `can` is the action you are giving the user
        # permission to do.
        # If you pass :manage it will apply to every action. Other common actions
        # here are :read, :create, :update and :destroy.
        #
        # The second argument is the resource the user can perform the action on.
        # If you pass :all it will apply to every resource. Otherwise pass a Ruby
        # class of the resource.
        #
        # The third argument is an optional hash of conditions to further filter the
        # objects.
        # For example, here the user can only update published articles.
        #
        #   can :update, Article, :published => true
        #
        # See the wiki for details:
        # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    end
end
