#include "pch.h"
#include <iostream>
#include <fstream>

using namespace std;

int main(int argc, char * argv[])
{
	if (argc != 3)
	{
		cout << "Invalid arguments count\nUsage: copyfile.exe <input file> <output file>\n";
		return 1;
	}

	ifstream input(argv[1]);
	if (!input.is_open())
	{
		cout << "Failed to open " << argv[1] << " for reading\n";
		return 1;
	}

	ofstream output(argv[2]);
	if (!output.is_open())
	{
		cout << "Failed to open " << argv[2] << " for writing\n";
		return 1;
	}

	char ch;
	int count = 99;
	while (input.get(ch) && count != 0)
	{
		if (!output.put(ch) || count == 0)
		{
			cout << "Failed to save data on disk\n";
			return 1;
		}
		if (ch == '\n')
		{
			output.put(ch);
		}
		count--;
	}

	if (!output.flush()) // Если не удалось сбросить данные на диск
	{
		cout << "Failed to save data on disk\n";
		return 1;
	}

	return 0;
}