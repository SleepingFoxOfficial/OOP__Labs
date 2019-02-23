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


bool CopyFileWithReplacement(const std::string input, const std::string output, const std::string searchStr, const std::string replacementStr)
{
	std::ofstream outputFile(output);
	std::ifstream inputFile(input);
	std::string search = searchStr;
	std::string replace = replacementStr;

	if (!inputFile)
	{
		std::cout << "Failed to open " << input << " for reading\n";
		return 1;
	}

	if (!outputFile)
	{
		std::cout << "Failed to open " << output << " for writing\n";
		return 1;
	}
	
	CopyFileWithReplace(inputFile, outputFile, search, replace);
	
	if (!outputFile.flush())
	{
		std::cout << "Failed to save data on disk\n";
		return 1;
	}
}

int main(int argc, char* argv[])
{
	if ((argc != 5) || (argv[3] == ""))
	{
		std::cout << "Invalid argument count\n" << "Usage: replace.exe <inputFile> <outputFile> <searchString> <replacementString>\n";
		return 1;
	};
	return CopyFileWithReplacement(argv[1], argv[2], argv[3], argv[4]);
	return 0;
}