using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Incidencias.Models;

namespace Incidencias.Controllers
{
    public class LineasTicketsController : Controller
    {
        private Model1Container db = new Model1Container();

        // GET: LineasTickets
        public ActionResult Index()
        {
            return View(db.LineasTicketSet.ToList());
        }

        // GET: LineasTickets/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LineasTicket lineasTicket = db.LineasTicketSet.Find(id);
            if (lineasTicket == null)
            {
                return HttpNotFound();
            }
            return View(lineasTicket);
        }

        // GET: LineasTickets/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LineasTickets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Descripcion,Tiempo")] LineasTicket lineasTicket)
        {
            if (ModelState.IsValid)
            {
                db.LineasTicketSet.Add(lineasTicket);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(lineasTicket);
        }

        // GET: LineasTickets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LineasTicket lineasTicket = db.LineasTicketSet.Find(id);
            if (lineasTicket == null)
            {
                return HttpNotFound();
            }
            return View(lineasTicket);
        }

        // POST: LineasTickets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Descripcion,Tiempo")] LineasTicket lineasTicket)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lineasTicket).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lineasTicket);
        }

        // GET: LineasTickets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LineasTicket lineasTicket = db.LineasTicketSet.Find(id);
            if (lineasTicket == null)
            {
                return HttpNotFound();
            }
            return View(lineasTicket);
        }

        // POST: LineasTickets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LineasTicket lineasTicket = db.LineasTicketSet.Find(id);
            db.LineasTicketSet.Remove(lineasTicket);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
