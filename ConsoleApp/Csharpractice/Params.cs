using System;
namespace AccessSpecifiers
{
    class Program
    {
        public void Show(params int[] val)
        {
            for(int i = 0; i < val.Length; i++)
            {
                Console.WriteLine(val[i]);
            }
        }
        static void Main(string[] args) { 
        Program program = new Program();
            program.Show(1,2,3,4);
        
        }
    }
}

