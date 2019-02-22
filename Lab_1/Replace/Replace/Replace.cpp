#include "pch.h"

std::string ReplaceString(const std::string& subject, const std::string& searchString, const std::string& replacementString)
{
	size_t pos = 0;
	std::string result;
	while (pos < subject.length())
	{
		size_t foundPos = subject.find(searchString, pos);
		result.append(subject, pos, foundPos - pos);
		if (foundPos != std::string::npos)
		{
			result.append(replacementString);
			pos = foundPos + searchString.length();
		}
		else
		{
			break;
		}
	}
	return result;
}

void CopyFileWithReplace(std::istream& input, std::ostream& output, const std::string& searchString, const std::string& replacementString)
{
	std::string line;
	while (std::getline(input, line))
	{
		output << ReplaceString(line, searchString, replacementString) << "\n";
	}
}

bool CheckFileManager(std::istream& input, std::ostream& output, std::string InFileName, std::string OutFileName)
{
	bool flag = false;
	if (!input)
	{
		std::cout << "Failed to open " << InFileName << " for reading\n";
		flag = true;
	} 

	if (!output)
	{
		std::cout << "Failed to open " << OutFileName << " for writing\n";
		flag = true;
	}
	if (flag) 
	{ 
		return true;
	}
	else
	{
		return false;
	}

}

int main(int argc, char* argv[])
{
	if (argc != 5)
	{
		std::cout << "Invalid argument count\n" << "Usage: replace.exe <inputFile> <outputFile> <searchString> <replacementString>\n";
		return 1;
	};

	std::ofstream outputFile(argv[2]);
	std::ifstream inputFile(argv[1]);

	if (CheckFileManager(inputFile, outputFile, argv[1], argv[2])) {
		return 1;
	}

	std::string search = argv[3];
	std::string replace = argv[4];

	CopyFileWithReplace(inputFile, outputFile, search, replace);
	if (!outputFile.flush())
	{
		std::cout << "Failed to save data on disk\n";
		return 1;
	}

	return 0;
}