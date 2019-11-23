package customer.dto;

public class Manager {
	
	private String mgrID;
	private String mgrPW;
	
	public Manager() {
		// TODO Auto-generated constructor stub
	}

	public Manager(String mgrID, String mgrPW) {
		super();
		this.mgrID = mgrID;
		this.mgrPW = mgrPW;
	}

	public String getMgrID() {
		return mgrID;
	}

	public void setMgrID(String mgrID) {
		this.mgrID = mgrID;
	}

	public String getMgrPW() {
		return mgrPW;
	}

	public void setMgrPW(String mgrPW) {
		this.mgrPW = mgrPW;
	}

	@Override
	public String toString() {
		return "Manager [mgrID=" + mgrID + ", mgrPW=" + mgrPW + "]";
	}
	
	
}
