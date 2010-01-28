class NotesController < FrontendController
  
  add_crumb ('Tiskové zprávy') { |instance| instance.send :notes_path }
  before_filter :load_record, :only => [:show]
  
  private
  
    def load_record
      @note = Note.find(params[:id])
      add_crumb @note.name
    end
  
end
