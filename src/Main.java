import jess.JessException;
import jess.Rete;


public class Main {

	/**
	 * @param args
	 */
	public static Rete r = new Rete();
	public static void main(String[] args) {
		try {
			r.batch("../source.clp");
			
		} catch (JessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
