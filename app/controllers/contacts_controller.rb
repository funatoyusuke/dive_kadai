class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contcts = Contact.create(contact_params)
        if @contcts.save
            redirect_to "/contacts/new"
        else
            flash[:notice] ="エラーが発生しました。各項目を1文字以上140文字以下で再入力してください。"
            redirect_to "/contacts/new"
        end
    end

  private
  def contact_params
      params.require(:contact).permit(:name,:email,:content)
  end
end
