using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ForumCoderASP.Models
{
    public class Course
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id_course { get; set; }

        [StringLength(255)]
        [Required]
        public string name { get; set; }

        public string description { get; set; }   

        [StringLength(255)]
        [Required]
        public string image { get; set; }

        public DateTime createdAt { get; set; }

        public int status { get; set; }


    }
}