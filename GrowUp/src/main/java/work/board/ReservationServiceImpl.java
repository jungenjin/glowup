package work.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("reservationService")
public class ReservationServiceImpl implements ReservationService{
	
	@Resource(name = "reservationDAO")
	private ReservationDAO reservationDAO;
	
	public List<Map<String, String>> reservationList(Map<String, String> reservationParam) {
		return reservationDAO.reservationList(reservationParam);
	}
	public Map<String, String> reservationView(Map<String, String> reservationParam) {
		return reservationDAO.reservationView(reservationParam);
	}
	public String maxReservationNo() {
		return reservationDAO.maxReservationNo();
	}
	public void reservationWrite(ReservationBean reservation) {
		reservationDAO.reservationWrite(reservation);	
		
		
	}
	public void reservationModify(ReservationBean reservation) {
		reservationDAO.reservationModify(reservation);
		
	}
	public void updateReservationHit(Map<String, String> reservationParam) {
		reservationDAO.updateReservationHit(reservationParam);
		
	}
	public void deleteReservation(Map<String, String> reservationParam) {
		reservationDAO.deleteReservation(reservationParam);
		
	}
	public void deleteReservation2(Map<String, String> reservationParam) {
		reservationDAO.deleteReservation2(reservationParam);
		
	}
	
	

}
