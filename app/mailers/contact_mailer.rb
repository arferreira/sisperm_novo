class ContactMailer < ApplicationMailer
  default :from => 'sisperm@bacg.intraer'

  def contact_message(contato, service, email_permanencia)
    @contact = contato
    puts "Contato: #{contato}" 

    @service = service
    mail(:to => 'sisperm@bacg.intraer', :cc => 'ricardosouzaaf@bacg.intraer',:subject => 'SISPERM - Passagem de serviço ao ETI')
  end
end
