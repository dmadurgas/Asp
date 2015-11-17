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
    public class TecnicosController : Controller
    {
        private Model1Container db = new Model1Container();

        // GET: Tecnicos
        public ActionResult Index()
        {
            return View(db.TecnicosSet.ToList());
        }

        // GET: Tecnicos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tecnicos tecnicos = db.TecnicosSet.Find(id);
            if (tecnicos == null)
            {
                return HttpNotFound();
            }
            return View(tecnicos);
        }

        // GET: Tecnicos/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Tecnicos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Nombre,Correo")] Tecnicos tecnicos)
        {
            if (ModelState.IsValid)
            {
                db.TecnicosSet.Add(tecnicos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tecnicos);
        }

        // GET: Tecnicos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tecnicos tecnicos = db.TecnicosSet.Find(id);
            if (tecnicos == null)
            {
                return HttpNotFound();
            }
            return View(tecnicos);
        }

        // POST: Tecnicos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Nombre,Correo")] Tecnicos tecnicos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tecnicos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tecnicos);
        }

        // GET: Tecnicos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tecnicos tecnicos = db.TecnicosSet.Find(id);
            if (tecnicos == null)
            {
                return HttpNotFound();
            }
            return View(tecnicos);
        }

        // POST: Tecnicos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tecnicos tecnicos = db.TecnicosSet.Find(id);
            db.TecnicosSet.Remove(tecnicos);
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
