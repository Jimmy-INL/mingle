#  Copyright 2020 ThoughtWorks, Inc.
#  
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Affero General Public License as
#  published by the Free Software Foundation, either version 3 of the
#  License, or (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Affero General Public License for more details.
#  
#  You should have received a copy of the GNU Affero General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/agpl-3.0.txt>.

class ChangeProjectMemberReadonlyToReadonlyuserToAvoidClashingWithRails20 < ActiveRecord::Migration
  def self.up
    add_column :projects_members, :readonly_member, :boolean, :default => false
    ActiveRecord::Base.connection.execute("UPDATE #{safe_table_name("projects_members")} SET readonly_member = readonly")
    remove_column :projects_members, :readonly
  end

  def self.down
    raise 'Cannot migrate this migration down as it interferes with Rails 2.0'
  end
end
