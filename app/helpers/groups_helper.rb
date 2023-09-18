module GroupsHelper
    def get_group_id
        if @group.nil?
          nil
        else
          @group.id
        end
    end
end
