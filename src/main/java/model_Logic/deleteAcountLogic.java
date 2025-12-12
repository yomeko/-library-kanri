package model_Logic;

import DAO.deleteAcountDAO;
import model.User;

public class deleteAcountLogic {
	public boolean delete(User user) {
		deleteAcountDAO dao = new deleteAcountDAO();
		return dao.deletem(user);
	}
}
