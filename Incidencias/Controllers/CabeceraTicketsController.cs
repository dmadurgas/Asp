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
    public class CabeceraTicketsController : Controller
    {
        private Model1Container db = new Model1Container();

        // GET: CabeceraTickets
        public ActionResult Index()
        {
            var cabeceraTicketsSet = db.CabeceraTicketsSet.Include(c => c.Clientes).Include(c => c.Productos);
            return View(cabeceraTicketsSet.ToList());
        }

        // GET: CabeceraTickets/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CabeceraTickets cabeceraTickets = db.CabeceraTicketsSet.Find(id);
            if (cabeceraTickets == null)
            {
                return HttpNotFound();
            }
            return View(cabeceraTickets);
        }

        // GET: CabeceraTickets/Create
        public ActionResult Create()
        {
            ViewBag.ClientesCif = new SelectList(db.ClientesSet, "Cif", "Nombre");
            ViewBag.ProductosId = new SelectList(db.ProductosSet, "Id", "Nombre");
            return View();
        }

        // POST: CabeceraTickets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,FechaApertura,FechaCierre,TiempoTotal,Facturable,ClientesCif,ProductosId,Tipo")] CabeceraTickets cabeceraTickets)
        {
            if (ModelState.IsValid)
            {
                db.CabeceraTicketsSet.Add(cabeceraTickets);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ClientesCif = new SelectList(db.ClientesSet, "Cif", "Nombre", cabeceraTickets.ClientesCif);
            ViewBag.ProductosId = new SelectList(db.ProductosSet, "Id", "Nombre", cabeceraTickets.ProductosId);
            return View(cabeceraTickets);
        }

        // GET: CabeceraTickets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CabeceraTickets cabeceraTickets = db.CabeceraTicketsSet.Find(id);
            if (cabeceraTickets == null)
            {
                return HttpNotFound();
            }
            ViewBag.ClientesCif = new SelectList(db.ClientesSet, "Cif", "Nombre", cabeceraTickets.ClientesCif);
            ViewBag.ProductosId = new SelectList(db.ProductosSet, "Id", "Nombre", cabeceraTickets.ProductosId);
            return View(cabeceraTickets);
        }

        // POST: CabeceraTickets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,FechaApertura,FechaCierre,TiempoTotal,Facturable,ClientesCif,ProductosId,Tipo")] CabeceraTickets cabeceraTickets)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cabeceraTickets).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ClientesCif = new SelectList(db.ClientesSet, "Cif", "Nombre", cabeceraTickets.ClientesCif);
            ViewBag.ProductosId = new SelectList(db.ProductosSet, "Id", "Nombre", cabeceraTickets.ProductosId);
            return View(cabeceraTickets);
        }

        // GET: CabeceraTickets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CabeceraTickets cabeceraTickets = db.CabeceraTicketsSet.Find(id);
            if (cabeceraTickets == null)
            {
                return HttpNotFound();
            }
            return View(cabeceraTickets);
        }

        // POST: CabeceraTickets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CabeceraTickets cabeceraTickets = db.CabeceraTicketsSet.Find(id);
            db.CabeceraTicketsSet.Remove(cabeceraTickets);
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
