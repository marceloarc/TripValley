using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using TripValley.Models;

namespace TripValley.Controllers
{
    public class CustomersController : ApiController
    {
        private readonly TripValleyContext db = new TripValleyContext();

        // GET: api/Customers/Get
        public List<Customer> Get()
        {
            List<Customer> customers = new List<Customer>();
            customers = db.Customers.Include(a => a.Addresses).ToList();
            return customers;
        }

        // GET: api/Customers/Get/id
        [ResponseType(typeof(Customer))]
        public async Task<IHttpActionResult> Get(int id)
        {
            Customer customer =  db.Customers.Where(e => e.customer_id == id).Include(a => a.Addresses).FirstOrDefault();
            if (customer == null)
            {

                return Ok(JsonResult(true, "Usuário não econtrado!"));
            }

            return Ok(customer);
        }

        // PUT: api/Customers/Edit/id
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> Edit(int id, Customer customer)
        {
            if (!ModelState.IsValid)
            {
                return Ok(JsonResult(true, "Algum dado está incorreto ou faltando!"));
            }

            if (id != customer.customer_id)
            {
                return Ok(JsonResult(true, "A definir erro!"));
            }

            if (!CustomerExists(customer.User.email))
            {
                return Ok(JsonResult(true, "Usuário não existente!"));
            }

            db.Entry(customer).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CustomerExists(customer.User.email))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Customers
        [ResponseType(typeof(Customer))]
        public async Task<IHttpActionResult> Register(Customer customer)
        {
            if (!ModelState.IsValid)
            {
                return Ok(JsonResult(true, "Algum dado está incorreto ou faltando!"));
            }


            if (CustomerExists(customer.User.email))
            {
                return Ok(JsonResult(true, "Um usuário ja esta cadastrado com este e-mail!"));
            }

            string hash = BCrypt.Net.BCrypt.HashPassword(customer.User.password);

            customer.User.password = hash;

            customer.User.date_added = DateTime.Now.ToString("yyyy-MM-dd");

            db.Customers.Add(customer);

            try
            {
                await db.SaveChangesAsync();

            }
            catch (DbUpdateException)
            {
                throw;
            }

             return Ok(JsonResult(false, customer));
        }

   
        [ResponseType(typeof(Customer))]
        public async Task<IHttpActionResult> Login(User user)
        {
            if (!ModelState.IsValid)
            {
                return Ok(JsonResult(true, "Algum dado está incorreto ou faltando!"));
            }

            Customer customer = GetCustomerByEmail(user.email);

            if(customer != null)
            {
                if(BCrypt.Net.BCrypt.Verify(user.password, customer.User.password))
                {
                

                    return Ok(JsonResult(false, customer));
                }
                else
                {
                    return Ok(JsonResult(true, "email ou senha incorretos!"));
                }

            }
            else
            {
                return Ok(JsonResult(true, "email ou senha incorretos!"));
            }
        }

        // DELETE: api/Customers/Delete/id
        [ResponseType(typeof(Customer))]
        public async Task<IHttpActionResult> Delete(int id)
        {
            Customer customer = await db.Customers.FindAsync(id);
            if (customer == null)
            {
    
                return Ok(JsonResult(true, "Usuário não encontrado!"));
            }

            db.Customers.Remove(customer);
            await db.SaveChangesAsync();

            return Ok(customer);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CustomerExists(string email)
        {
            return db.Customers.Count(e => e.User.email == email) > 0;
        }

        private Customer GetCustomerByEmail(string email)
        {
            return db.Customers.Where(e => e.User.email == email).Include(a => a.Addresses).FirstOrDefault();
        }

        object JsonResult(bool error, string message)
        {
            var result = new
            {
                error = error,
                message = message
            };
            return result;
        }
        object JsonResult(bool error, Customer customer)
        {
            var result = new
            {
                error = error,
                customer = customer
            };
            return result;
        }
    }
}