package matrixmultipl;

import java.util.Scanner;

public class Driver {

	
	    public static void main(String[] args) 
	    {
	        function();
	    }
	    
	    
	    public static void function()
	    {  
	        int row1, column1, row2, column2;
	       
	        Scanner scan_in = new Scanner(System.in); 
	        
	        
	        System.out.println("Unesite broj redova prve matrice: ");
	        row1 = scan_in.nextInt();

	        System.out.println("Unesite broj kolona prve matrice: ");
	        column1 = scan_in.nextInt();

	        System.out.println("Unesite broj redova druge matrice: ");
	        row2 = scan_in.nextInt();

	        System.out.println("Unesite broj kolona druge matrice: ");
	        column2 = scan_in.nextInt(); 
	        
	        
	        //Matrix matrix1 = new Matrix(row1, column1);
	        //Matrix matrix2 = new Matrix(row2, column2);
	        
	        if(column1 != row2)
	        {
	            System.out.println("Matrice zadatih dimenzija se ne mogu pomnoziti");
	            System.exit(1);
	        }
	        else
	        {
	        	
	            int A[][] = new int[row1][column1];
	            int B[][] = new int[row2][column2];

	            for(int i = 0; i < row1; i++)
	            {      
	                System.out.println("Unesite brojeve " + (i+1) + "-og reda prve matrice: ");

	                for(int j = 0; j < column1; j++)
	                {
	                    A[i][j] = scan_in.nextInt();
	                }
	            }

	            for(int i = 0; i < row2; i++)
	            {      
	                System.out.println("Unesite brojeve " + (i+1) + "-og reda druge matrice: ");

	                for(int j = 0; j < column2; j++)
	                {
	                    B[i][j] = scan_in.nextInt();
	                }
	            }

	            scan_in.close();

	            System.out.println("Matrica 1:");
	            printMatrix(A);
	            System.out.println("Matrica 2:");
	            printMatrix(B);

	            System.out.println("Rezultujuca matrica: ");
	            printMatrix(matrixMultiplication(A, B));
	        	
	        	
	        	//MATRIX OBJ
	        	/*for(int i = 0; i < matrix1.getRow(); i++)
	            {      
	                System.out.println("Unesite brojeve " + (i+1) + "-og reda prve matrice: ");

	                for(int j = 0; j < matrix1.getColumn(); j++)
	                {
	                    matrix1.setMatrixElement(i, j, scan_in.nextInt());
	                }
	            }

	            for(int i = 0; i < matrix2.getRow(); i++)
	            {      
	                System.out.println("Unesite brojeve " + (i+1) + "-og reda druge matrice: ");

	                for(int j = 0; j < matrix2.getColumn(); j++)
	                {
	                	matrix2.setMatrixElement(i, j, scan_in.nextInt());
	                }
	            }

	            scan_in.close();
	            
	            System.out.println("Matrica 1:");
	            matrix1.printMatrix();
	            System.out.println("Matrica 2:");
	            matrix2.printMatrix();
	            
	            Matrix resultMatrix = matrix1.matrixMultiplication(matrix2);
	            
	            System.out.println("Rezultujuca matrica:");
	        	resultMatrix.printMatrix();*/
	        }
	    }
	    
	    public static void printMatrix(int matrix[][])
	    {
	        int row = matrix.length;
	        int column = matrix[0].length;
	        
	        for (int i = 0; i < row; i++) 
	        {
	            for (int j = 0; j < column; j++) 
	            {
	                System.out.print(matrix[i][j] + " ");
	            }
	            System.out.println();
	        }
	    }
	    
	    public static int[][] matrixMultiplication(int matrix1[][], int matrix2[][])
	    {
	        int row1 = matrix1.length;
	        int col1 = matrix1[0].length;
	        int col2 = matrix2[0].length;
	        int[][] c = new int[row1][col2];
	        
	        for (int i = 0; i < row1; i++) 
	        {
	            for (int j = 0; j < col2; j++) 
	            {
	                for (int k = 0; k < col1; k++) 
	                {
	                    c[i][j] = c[i][j] + matrix1[i][k] * matrix2[k][j];
	                }
	            }
	        }
	        return c;
	    }
	

}
