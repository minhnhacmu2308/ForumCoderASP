using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ForumCoderASP.Models
{
    public class User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id_user { get; set; }


        [StringLength(255)]
        [Required]
        public string password { get; set; }

        [StringLength(255)]
        [Required]
        public string fullname { get; set; }

        [StringLength(255)]
        [Required]
        public string email { get; set; }

        public int status { get; set; }

        public virtual ICollection<Post> posts { get; set; }

        public virtual ICollection<Comment> Comments { get; set; }
    }
}