class CheckresController < ApplicationController
    def checkresult
        @usn_id=params[:search]
        @learners=Student.all.where("lower(usn) LIKE :search",search: "%#{@usn_id}%")
        @marks=Outcome.all.where("lower(usn) LIKE :search",search: "%#{@usn_id}%")
        #@ids= []
        #@learners.each do |learner|
         # @ids <<learner.id
        #end
        #@marks=Reward.where(student_id: @learners.ids)
        #@courseids=@marks.map(&:course_id)
        
        @courseids=@marks.map(&:course_code)
        @subs=Course.all.where(course_code: @courseids)
        
      end
      def check
          #@results=Result.search(params[:search])
     
        #@usn_id=params[:search]
        #@learner=Student.find(search: @usn_id)
        @learner=Student.find(1)
  
        @marks=@learner.result
    
  
      end
  
end
