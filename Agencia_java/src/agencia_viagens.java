

public class agencia_viagens {
	String nome_Ag;
	String telefone_Ag;
	String email_Ag;


     public agencia_viagens(String nome_Ag, String telefone_Ag, String email_Ag) {
            this.nome_Ag= nome_Ag;
            this.telefone_Ag = telefone_Ag;
            this.email_Ag = email_Ag;
            
 }


	public String getNome_Ag() {
		return nome_Ag;
	}


	public void setNome_Ag(String nome_Ag) {
		this.nome_Ag = nome_Ag;
	}


	public String getTelefone_Ag() {
		return telefone_Ag;
	}


	public void setTelefone_Ag(String telefone_Ag) {
		this.telefone_Ag = telefone_Ag;
	}


	public String getEmail_Ag() {
		return email_Ag;
	}


	public void setEmail_Ag(String email_Ag) {
		this.email_Ag = email_Ag;
	}
}







