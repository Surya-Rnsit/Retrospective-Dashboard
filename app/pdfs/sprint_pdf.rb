class SprintPdf < Prawn::Document
  def initialize(sprint)
    super()
      @sprint=sprint
      @what_went_well=@sprint.what_went_wells.all
      @action_items=@sprint.actionitems.all
      @what_went_wrong=@sprint.what_went_wrongs.all
      @improvements=@sprint.improvements.all
      @completed_story=@sprint.completed_stories.all

      text "Retrospective Board", size: 30, style: :bold, align: :center
      move_down 5
      text "Sprint Duration : #{@sprint.created_at.to_date} To #{@sprint.created_at.to_date+13}", size: 15, style: :bold, align: :center
      move_down 10
      text "#{@sprint.name}", size: 25, style: :bold, align: :center
      move_down 15

      text "What Went Well", size: 20, style: :bold
      what_went_well_items 
      
      move_down 15
      text "What Went Wrong", size: 20, style: :bold
      what_went_wrong_items


      move_down 15
      text "How can we Improve", size: 20, style: :bold
      improvement_items

      move_down 15
      text "Demo of completed stories", size: 20, style: :bold
      completed_story_items

      move_down 15
      text "Action List", size: 20, style: :bold
      action_items

    end
 
    def what_went_well_items
      move_down 15
      table what_went_well_rows do
        row(0).font_style = :bold
        self.row_colors = ["DDDDDD", "FFFFFF"]
        self.header = true
        self.column_widths = [400, 75]
      end
    end

    def what_went_well_rows
      [["What Went Well", "Likes"]] +
      @what_went_well.map do |well|
        [well.body, well.likes]
      end  
    end

    def what_went_wrong_items
      move_down 15
      table what_went_wrong_rows do
        row(0).font_style = :bold
        self.row_colors = ["DDDDDD", "FFFFFF"]
        self.header = true
        self.column_widths = [400, 75]
      end
    end

    def what_went_wrong_rows
      [["What Went Wrong", "Likes"]] +
      @what_went_wrong.map do |wrong|
        [wrong.body, wrong.likes]
      end  
    end

    def improvement_items
      move_down 15
      table improvement_items_rows do
        row(0).font_style = :bold
        self.row_colors = ["DDDDDD", "FFFFFF"]
        self.header = true
        self.column_widths = [400, 75]
      end
    end

    def improvement_items_rows
      [["How can we improve", "Likes"]] +
      @improvements.map do |improvements|
        [improvements.body, improvements.likes]
      end  
    end

    def completed_story_items
      move_down 15
      table completed_story_items_rows do
        row(0).font_style = :bold
        self.row_colors = ["DDDDDD", "FFFFFF"]
        self.header = true
        self.column_widths = [400, 75]
      end
    end

    def completed_story_items_rows 
      [["Demo of completed stories"]] +
      @completed_story.map do |completed_story|
        [completed_story.body]
      end  
    end

    def action_items
      move_down 15
      table action_items_rows do
        row(0).font_style = :bold
        self.row_colors = ["DDDDDD", "FFFFFF"]
        self.header = true
        self.column_widths = [300, 100, 120]
      end
    end

    def action_items_rows
      [["Action List", "Status", "Completed Date"]] +
      @action_items.map do |action_items|
        [action_items.body, 
          if action_items.ischeck
            "Completed"
          else
            "Not Completed"
          end,  
          if action_items.ischeck
            action_items.updated_at.to_date.to_s
          else
            " " 
          end  ]
      end  
    end
end
