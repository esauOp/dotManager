class Task < ActiveRecord::Base

	belongs_to :project
  belongs_to :usuario
	has_many :task_histories
  has_many :task_comments

	# def to_param
	# 	#{}"#{id}-#{name}"	
	# 	name.downcase.gsub(/\s+/, '-')
	# end
	def as_json(options = {})
    {
      :id => self.id,
      :title => self.name + " - " + self.usuario.name,
      :description => self.description || "",
      :start => date_ini,
      :end => date_end,
      :allDay => true,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.task_path(self.id)
    }
    
  end

  def self.as_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
end
