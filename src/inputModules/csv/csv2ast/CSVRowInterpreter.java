package inputModules.csv.csv2ast;

import inputModules.csv.KeyedCSV.KeyedCSVRow;

public interface CSVRowInterpreter
{
	public long handle(KeyedCSVRow row, ASTUnderConstruction ast);
}