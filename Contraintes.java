import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Contraintes {

	public static void main(String args[]){
	  
	  	// On créer un nouveau fichier
		File ff=new File("Contraintes.txt");
		
		// On créer un écrivain
		FileWriter ffw;
		try {
			ffw = new FileWriter(ff);
			
			//Contrainte 13 - 1
			for (int i = 1; i <= 4; i++) {
				for (int j = 1; j <= 2; j++) {
					for (int l = 1; l <= 5; l++) {
						try {
							int nb = (l-1)*4 + 1;
							ffw.write("c13_" + i + "_" + j + "_" + l + " : sum{k in " + nb + ".." + l * 4 + "} x[" + i + "," + j + ",k] <= 1;\n");
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
			
			//Contrainte 13 - bis
			for (int i = 5; i <= 6; i++) {
				for (int j = 1; j <= 2; j++) {
					for (int l = 1; l <= 5; l++) {
						try {
							int nb = (l-1)*4 + 1;
							ffw.write("c13_" + i + "_" + j + "_" + l + " : sum{k in " + nb + ".." + l * 4 + "} x[" + i + "," + j + ",k] <= 2;\n");
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
			
			//Contrainte 13 - 2
			for (int i = 7; i <= 8; i++) {
				for (int j = 1; j <= 2; j++) {
					for (int l = 1; l <= 5; l++) {
						try {
							int nb = (l-1)*4 + 1;
							ffw.write("c13_" + i + "_" + j + "_" + l + " : sum{k in " + nb + ".." + l * 4 + "} x[" + i + "," + j + ",k] <= 1;\n");
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
			
			//Contrainte 14
			
			for (int j = 1; j <= 2; j++) {
				for (int k = 1; k <= 20; k++) {
					ffw.write("c14_" + j + "_" + k + " : sum{i in 1..p} x[i," + j + "," + k + "] <= 1;\n");
				}
			}
			
			//Contrainte 15
			
			for (int i = 1; i <= 8; i++) {
				for (int k = 1; k <= 20; k++) {
					ffw.write("c15_" + i + "_" + k + " : sum{j in 1..c} x[" + i + ",j" + "," + k + "] <= 1;\n");
				}
			}
			
			// On ferme l'écrivain
			ffw.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
