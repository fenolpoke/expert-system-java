import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.ScrollPaneLayout;



public class Template extends JFrame implements ActionListener{
	
	private static final long serialVersionUID = 1L;
	
	JLabel [] label = new JLabel [3];
	JTextArea [] txt = new JTextArea [3];
	JButton close = new JButton("Close");
	String []kata = new String[3];
	JScrollPane pane = new JScrollPane();
	JPanel pane2 = new JPanel();
	
	public Template(){
		
		kata[0] = "Motherboard : ";
		kata[1] = "Processor : ";
		kata[2] = "Total recommended price : ";
		
		
		setTitle("The Result of Simulation");
		setSize(500, 200);
		pane.setLayout(new ScrollPaneLayout());
		pane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		pane2.setLayout(new BoxLayout(pane2, BoxLayout.Y_AXIS));

		for(int i=0;i<3;i++)
		{
			txt[i] = new JTextArea();
			txt[i].setLineWrap(true);
			txt[i].setWrapStyleWord(true);
			txt[i].setEditable(false);
			txt[i].setAlignmentX(CENTER_ALIGNMENT);
			label[i] = new JLabel("",JLabel.CENTER);
			label[i].setText(kata[i]);
		}
		
		
		//Code in here
		
		
		
		
		
		
		for(int i=0;i<3;i++)
		{
			pane2.add(label[i]);
			pane2.add(txt[i]);
		}
		add(pane);
		pane.getViewport().add(pane2);
		add(close,"South");
		close.addActionListener(this);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setVisible(true);
		
	}

	public void actionPerformed(ActionEvent arg0) {
		if(arg0.getSource()==close)
			this.dispose();
	}
	
}
