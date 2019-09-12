package matrixmultipl;

public class Matrix 
{
	private int row, column;
	private int[][] array;
	
	public Matrix(int row, int column)
	{
		this.row = row;
		this.column = column;
		this.array = new int[row][column];
	}
	
	public int getRow() 
	{
		return row;
	}
	public void setRow(int row) 
	{
		this.row = row;
	}
	public int getColumn() 
	{
		return column;
	}
	public void setColumn(int column) 
	{
		this.column = column;
	}
	
	
	
	public void setMatrixElement(int i, int j, int value)
	{
		this.array[i][j] = value;
	}
	
	public int getMatrixElement(int i, int j)
	{
		return this.array[i][j];
	}
	
	
	
	public  Matrix matrixMultiplication(Matrix matrix1)
    {
		Matrix  newMatrix = new Matrix(this.row, matrix1.column);
        
        for (int i = 0; i < this.row; i++) 
        {
            for (int j = 0; j < matrix1.column; j++) 
            {
                for (int k = 0; k < this.column; k++) 
                {
                    newMatrix.setMatrixElement(i, j, newMatrix.getMatrixElement(i, j) + this.getMatrixElement(i, k)*matrix1.getMatrixElement(k, j));
                }
            }
        }
        return newMatrix;
    }
	
	
	public void printMatrix()
    {        
        for (int i = 0; i < this.row; i++) 
        {
            for (int j = 0; j < this.column; j++) 
            {
                System.out.print(this.getMatrixElement(i, j) + " ");
            }
            System.out.println();
        }
    }
	
}
