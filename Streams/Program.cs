using System;
using System.IO;

namespace Streams
{
    class Program
    {
        static void Main(string[] args)
        {
            using (FileStream fs = new FileStream(".", FileMode.Open, FileAccess.Read))
            {
                byte[] bytes = new byte[fs.Length];
                int bytesToRead = (int)fs.Length;
                int bytesRead = 0;
                while (bytesToRead > 0)
                {
                    int n = fs.Read(bytes, bytesRead, bytesToRead);
                    if (n == 0) break;
                    bytesRead += n;
                    bytesToRead -= n;
                }

                bytesToRead = bytes.Length;
                Console.WriteLine("Read {0} bytes from original file...", bytesRead);
            }
        }
    }
}